view: anomaly_alert {
  derived_table: {
    sql: WITH PO as ( -- createPurchaseOrder
          SELECT sales_document, DATETIME(created_at, "Europe/Berlin") as SO_createDate, last_change_datetime, total_net_amount, your_reference, sold_to_party
          FROM `mms-plg-looker-poc-a.sales_order.sales_order`
          WHERE sales_document_type = 'ZORE'
      ),
      POR as ( -- purchase order response
          SELECT
              header.numbers.vendorOrderNumber
            , header.numbers.orderNumber
            , header.sourceSystem, header.appointmentDate
            , DATETIME(header.deliveryInfo.notBeforeDate, "Europe/Berlin") as notBeforeDate
            , DATETIME(header.appointmentDate, "Europe/Berlin") as POR_appointmentDate
            , po_insert_id
          FROM `mms-plg-looker-poc-a.PurchaseOrder.PurchaseOrder`
      --    WHERE DATE(_PARTITIONTIME) >= "2022-04-20"
      ),
      SO as ( -- sales order from webshop (not in the picture)
          SELECT
              orderNumber
            , deliveryDetails.deliveryType
            , deliveryDetails.pickupOutletId
          FROM `mms-plg-looker-poc-a.SalesOrder.SalesOrder`
      --    WHERE DATE(_PARTITIONTIME) >= "2022-04-20"
      ),
      DA as ( -- despatch advice
          SELECT distinct
              despatchAdviceNumber
            , LineItems.externalOrderNumber
            , JMSTimestamp
            , da.expectedDeliveryTime
          FROM `mms-plg-looker-poc-a.DespatchAdvice.DA_Seeburger` da
          , unnest(masterShipmentContainer) masterShipmentContainer
          , unnest(masterShipmentContainer.shipmentContainer) shipmentContainer
          , unnest(shipmentContainer.LineItems) LineItems
      --    WHERE DATE(_PARTITIONTIME) >= "2022-05-11"
          WHERE LineItems.externalOrderNumber   is not null
      ),
      RecAdv as ( -- receiving advice
          SELECT recadv.deliveryNoteNumber, min(datetime(messageTimestamp, "Europe/Berlin")) as messageTimestamp
          FROM `mms-plg-looker-poc-a.ReceivingAdvice.ReceivingAdvice`
      --    WHERE DATE(_PARTITIONTIME) >= "2022-05-11"
          group by 1
      )
      SELECT distinct
      -- PO
          PO.sales_document as SAP_SALES_DOCUMENT
        , cast(PO.SO_createDate as datetime) as SAP_CREATE
        , right(PO.sold_to_party, 3) AS SAP_OUTLET
        , PO.your_reference AS SAP_REFERENCE
      -- SO
        , deliveryType as SO_DELIVERY_TYPE
        , SO.pickupOutletId as SO_PICKUP_OUTLET_ID
      -- POR
        , POR.notBeforeDate AS POR_NOT_BEFORE
        , cast (POR.POR_appointmentDate as datetime) AS POR_APPOINTMENT
      -- DA
        , DA.JMSTimestamp as DA_timestamp
        , DA.despatchAdviceNumber AS DA_NUMBER
        , DA.expectedDeliveryTime AS DA_EXPECTED_DELIVERY
      -- RecAdv
        , RecAdv.messageTimestamp as RECADV_Timestamp
        , case when POR.orderNumber is null then "PO missing"  -- Alert after 10 minutes
               when DA.despatchAdviceNumber is null then "DA missing"
               when RecAdv.messageTimestamp is null then "RecAdv missing" -- Alert 2 days after DA was created
               else "Order completed"
          end as DA_ORDER_STATUS
      FROM PO
      left JOIN POR on PO.sales_document = POR.vendorOrderNumber
      left JOIN SO on PO.your_reference = CAST(SO.orderNumber as STRING)
      left JOIN DA on PO.sales_document = DA.externalOrderNumber
      left JOIN RecAdv on DA.despatchAdviceNumber = RecAdv.deliveryNoteNumber
      where deliveryType not in ('SAME_DAY_PICKUP')
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sap_sales_document {
    type: string
    label: "SAP Sales Document"
    sql: ${TABLE}.SAP_SALES_DOCUMENT ;;

  }

  dimension_group: sap_create {
    label: "SAP Created"
    type: time
    datatype: datetime
    sql: ${TABLE}.SAP_CREATE ;;
  }

  dimension: sap_outlet {
    label: "SAP Outlet"
    type: string
    sql: ${TABLE}.SAP_OUTLET ;;
  }

  dimension: sap_reference {
    label: "SAP Reference"
    type: string
    sql: ${TABLE}.SAP_REFERENCE ;;
  }

  dimension: so_delivery_type {
    label: "SO Delivery type"
    type: string
    sql: ${TABLE}.SO_DELIVERY_TYPE ;;
  }

  dimension: so_pickup_outlet_id {
    label: "SO Pickup Outlet ID"
    type: number
    sql: ${TABLE}.SO_PICKUP_OUTLET_ID ;;
  }

  dimension_group: por_not_before {
    label: "POR Not before"
    type: time
    datatype: datetime
    sql: ${TABLE}.POR_NOT_BEFORE ;;
  }

  dimension_group: por_appointment {
    label: "POR Appointment"
    type: time
    datatype: datetime
    sql: ${TABLE}.POR_APPOINTMENT ;;
  }

  dimension_group: da_timestamp {
    label: "DA Timestamp"
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.DA_timestamp ;;
  }

  dimension: da_number {
    label: "DA Number"
    type: string
    sql: ${TABLE}.DA_NUMBER ;;
  }

  dimension_group: da_expected_delivery {
    label: "DA Expected delivery"
    type: time
    sql: ${TABLE}.DA_EXPECTED_DELIVERY ;;
  }

  dimension_group: recadv_timestamp {
    label: "RECADV timestamp"
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: datetime
    sql: ${TABLE}.RECADV_Timestamp ;;
  }

  dimension: da_order_status {
    label: "DA Order Status"
    type: string
    drill_fields: [sap_sales_document,sap_reference]
    sql: ${TABLE}.DA_ORDER_STATUS ;;
  }

# This is the time taken to receive advice at the pickup location after an item has been despatched from the warehouse
  dimension: post_despatch_advice_days {
    label: "Days after despatch"
    type: number
    sql: DATE_DIFF( ${recadv_timestamp_date}, ${da_timestamp_date}, day);;
  }

# This is the time taken to receive the order information at the store goods management system after it has been created by the customer
# The GMS tells the store who to give the products they recieve from the warehouse to
  dimension: post_order_created_minutes {
    label: "Minutes after created"
    type: number
    sql: DATE_DIFF( ${por_appointment_raw}, ${sap_create_raw}, minute);;
  }

  measure: m_post_despatch_advice_days {
    label: "Total days after despatch"
    type: sum
    sql: ${post_despatch_advice_days} ;;
  }

  measure: m_post_order_created_minutes {
    label: "Total minutes after created"
    type: sum
    sql: ${post_order_created_minutes} ;;
  }



  set: detail {
    fields: [
      sap_sales_document,
      sap_create_time,
      sap_outlet,
      sap_reference,
      so_delivery_type,
      so_pickup_outlet_id,
      por_not_before_date,
      por_appointment_time,
      da_timestamp_date,
      da_number,
      da_expected_delivery_time,
      recadv_timestamp_date,
      da_order_status
    ]
  }
}
