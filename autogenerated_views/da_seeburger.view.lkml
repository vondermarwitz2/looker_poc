# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: da_seeburger {
  hidden: no

  join: da_seeburger__master_shipment_container {
    view_label: "Da Seeburger: Mastershipmentcontainer"
    sql: LEFT JOIN UNNEST(${da_seeburger.master_shipment_container}) as da_seeburger__master_shipment_container ;;
    relationship: one_to_many
  }

  join: da_seeburger__master_shipment_container__shipment_container__level {
    view_label: "Da Seeburger: Mastershipmentcontainer Shipmentcontainer Level"
    sql: LEFT JOIN UNNEST(${da_seeburger__master_shipment_container.shipment_container__level}) as da_seeburger__master_shipment_container__shipment_container__level ;;
    relationship: one_to_many
  }

  join: da_seeburger__master_shipment_container__shipment_container__line_items {
    view_label: "Da Seeburger: Mastershipmentcontainer Shipmentcontainer Lineitems"
    sql: LEFT JOIN UNNEST(${da_seeburger__master_shipment_container.shipment_container__line_items}) as da_seeburger__master_shipment_container__shipment_container__line_items ;;
    relationship: one_to_many
  }

  join: da_seeburger__master_shipment_container__shipment_container {
    view_label: "Da Seeburger: Mastershipmentcontainer Shipmentcontainer"
    sql: LEFT JOIN UNNEST(${da_seeburger__master_shipment_container.shipment_container}) as da_seeburger__master_shipment_container__shipment_container ;;
    relationship: one_to_many
  }
}

view: da_seeburger {
  sql_table_name: `mms-plg-looker-poc-a.DespatchAdvice.DA_Seeburger`
    ;;

  dimension: buyer__gln {
    type: number
    sql: ${TABLE}.buyer.gln ;;
    group_label: "Buyer"
    group_item_label: "Gln"
  }

  dimension: buyer__number {
    type: number
    sql: ${TABLE}.buyer.number ;;
    group_label: "Buyer"
    group_item_label: "Number"
  }

  dimension: delivery_partner__gln {
    type: number
    sql: ${TABLE}.deliveryPartner.gln ;;
    group_label: "Delivery Partner"
    group_item_label: "Gln"
  }

  dimension: delivery_partner__number {
    type: number
    sql: ${TABLE}.deliveryPartner.number ;;
    group_label: "Delivery Partner"
    group_item_label: "Number"
  }

  dimension: despatch_advice_number {
    type: string
    sql: ${TABLE}.despatchAdviceNumber ;;
  }

  dimension: despatch_advice_oid {
    type: string
    sql: ${TABLE}.despatchAdviceOid ;;
  }

  dimension_group: despatch_advice {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.despatchAdviceTime ;;
  }

  dimension_group: expected_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.expectedDeliveryTime ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insert_id ;;
  }

  dimension_group: jmstimestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.JMSTimestamp ;;
  }

  dimension: master_shipment_container {
    hidden: yes
    sql: ${TABLE}.masterShipmentContainer ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.orderNumber ;;
  }

  dimension: order_process_type {
    type: string
    sql: ${TABLE}.orderProcessType ;;
  }

  dimension: outlet_id {
    type: number
    sql: ${TABLE}.outletId ;;
  }

  dimension: package_count {
    type: number
    sql: ${TABLE}.packageCount ;;
  }

  dimension: secondary_order_number {
    type: string
    sql: ${TABLE}.secondaryOrderNumber ;;
  }

  dimension: sender_id {
    type: number
    sql: ${TABLE}.senderId ;;
  }

  dimension_group: shipping {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shippingTime ;;
  }

  dimension: subsidiary {
    type: string
    sql: ${TABLE}.subsidiary ;;
  }

  dimension: supplier__gln {
    type: number
    sql: ${TABLE}.supplier.gln ;;
    group_label: "Supplier"
    group_item_label: "Gln"
  }

  dimension: supplier__number {
    type: number
    sql: ${TABLE}.supplier.number ;;
    group_label: "Supplier"
    group_item_label: "Number"
  }

  dimension: warehouse_id {
    type: number
    sql: ${TABLE}.warehouseId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: da_seeburger__master_shipment_container {
  dimension: da_seeburger__master_shipment_container {
    type: string
    hidden: yes
    sql: da_seeburger__master_shipment_container ;;
  }

  dimension: shipment_container {
    hidden: yes
    sql: shipmentContainer ;;
  }

  dimension: shipment_container__level {
    hidden: yes
    sql: ${TABLE}.shipmentContainer.level ;;
    group_label: "Shipment Container"
    group_item_label: "Level"
  }

  dimension: shipment_container__line_items {
    hidden: yes
    sql: ${TABLE}.shipmentContainer.LineItems ;;
    group_label: "Shipment Container"
    group_item_label: "Line Items"
  }
}

view: da_seeburger__master_shipment_container__shipment_container__level {
  dimension: carrier_id {
    type: string
    sql: ${TABLE}.carrierId ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.trackingNumber ;;
  }
}

view: da_seeburger__master_shipment_container__shipment_container__line_items {
  dimension: delivery_status {
    type: string
    sql: ${TABLE}.deliveryStatus ;;
  }

  dimension: ean_code {
    type: string
    sql: ${TABLE}.eanCode ;;
  }

  dimension: external_order_number {
    type: string
    sql: ${TABLE}.externalOrderNumber ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.orderNumber ;;
  }

  dimension: order_position_number {
    type: string
    sql: ${TABLE}.orderPositionNumber ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.productId ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.productName ;;
  }

  dimension: product_name2 {
    type: string
    sql: ${TABLE}.productName2 ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }
}

view: da_seeburger__master_shipment_container__shipment_container {
  dimension_group: expected_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.expectedDeliveryTime ;;
  }
}
