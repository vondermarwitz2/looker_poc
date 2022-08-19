# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: purchase_order {
  hidden: yes

  join: purchase_order__details {
    view_label: "Purchase Order: Details"
    sql: LEFT JOIN UNNEST(${purchase_order.details}) as purchase_order__details ;;
    relationship: one_to_many
  }

  join: purchase_order__header__involved_parties {
    view_label: "Purchase Order: Header Involvedparties"
    sql: LEFT JOIN UNNEST(${purchase_order.header__involved_parties}) as purchase_order__header__involved_parties ;;
    relationship: one_to_many
  }
}

view: purchase_order {
  sql_table_name: `mms-plg-looker-poc-a.PurchaseOrder.PurchaseOrder`
    ;;

  dimension: details {
    hidden: yes
    sql: ${TABLE}.details ;;
  }

  dimension: header__additionalorderinformation {
    type: string
    sql: ${TABLE}.header.additionalorderinformation ;;
    group_label: "Header"
    group_item_label: "Additionalorderinformation"
  }

  dimension_group: header__appointment {
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
    sql: ${TABLE}.header.appointmentDate ;;
  }

  dimension_group: header__delivery_info__not_after {
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
    sql: ${TABLE}.header.deliveryInfo.notAfterDate ;;
  }

  dimension_group: header__delivery_info__not_before {
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
    sql: ${TABLE}.header.deliveryInfo.notBeforeDate ;;
  }

  dimension: header__delivery_info__stock_location {
    type: number
    sql: ${TABLE}.header.deliveryInfo.stockLocation ;;
    group_label: "Header Delivery Info"
    group_item_label: "Stock Location"
  }

  dimension: header__involved_parties {
    hidden: yes
    sql: ${TABLE}.header.involvedParties ;;
    group_label: "Header"
    group_item_label: "Involved Parties"
  }

  dimension: header__numbers__order_number {
    type: string
    sql: ${TABLE}.header.numbers.orderNumber ;;
    group_label: "Header Numbers"
    group_item_label: "Order Number"
  }

  dimension: header__numbers__referenceordernumber {
    type: string
    sql: ${TABLE}.header.numbers.referenceordernumber ;;
    group_label: "Header Numbers"
    group_item_label: "Referenceordernumber"
  }

  dimension: header__numbers__vendor_order_number {
    type: string
    sql: ${TABLE}.header.numbers.vendorOrderNumber ;;
    group_label: "Header Numbers"
    group_item_label: "Vendor Order Number"
  }

  dimension: header__ordering_user_id {
    type: string
    sql: ${TABLE}.header.orderingUserId ;;
    group_label: "Header"
    group_item_label: "Ordering User ID"
  }

  dimension: header__ordermanufacturerid {
    type: string
    sql: ${TABLE}.header.ordermanufacturerid ;;
    group_label: "Header"
    group_item_label: "Ordermanufacturerid"
  }

  dimension: header__sales_terms_info__cash_discount {
    type: number
    sql: ${TABLE}.header.salesTermsInfo.cashDiscount ;;
    group_label: "Header Sales Terms Info"
    group_item_label: "Cash Discount"
  }

  dimension: header__sales_terms_info__valuta {
    type: number
    sql: ${TABLE}.header.salesTermsInfo.valuta ;;
    group_label: "Header Sales Terms Info"
    group_item_label: "Valuta"
  }

  dimension: header__source_system {
    type: string
    sql: ${TABLE}.header.sourceSystem ;;
    group_label: "Header"
    group_item_label: "Source System"
  }

  dimension: header__status {
    type: string
    sql: ${TABLE}.header.status ;;
    group_label: "Header"
    group_item_label: "Status"
  }

  dimension: header__supplier_id {
    type: number
    sql: ${TABLE}.header.supplierID ;;
    group_label: "Header"
    group_item_label: "Supplier ID"
  }

  dimension: header__types__order_type {
    type: string
    sql: ${TABLE}.header.types.orderType ;;
    group_label: "Header Types"
    group_item_label: "Order Type"
  }

  dimension: po_insert_id {
    type: string
    sql: ${TABLE}.po_insert_id ;;
  }

  dimension: technical_infos__subsidiary {
    type: string
    sql: ${TABLE}.technicalInfos.subsidiary ;;
    group_label: "Technical Infos"
    group_item_label: "Subsidiary"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: purchase_order__details {
  dimension: invoice_price_incl_duties__amount {
    type: number
    sql: ${TABLE}.invoicePriceInclDuties.amount ;;
    group_label: "Invoice Price Incl Duties"
    group_item_label: "Amount"
  }

  dimension: invoice_price_incl_duties__currency {
    type: string
    sql: ${TABLE}.invoicePriceInclDuties.currency ;;
    group_label: "Invoice Price Incl Duties"
    group_item_label: "Currency"
  }

  dimension: postion_number {
    type: number
    sql: postionNumber ;;
  }

  dimension: product_id {
    type: number
    sql: productId ;;
  }

  dimension: product_manufacturer_name {
    type: string
    sql: productManufacturerName ;;
  }

  dimension: product_name {
    type: string
    sql: productName ;;
  }

  dimension: product_supplier_id {
    type: string
    sql: productSupplierId ;;
  }

  dimension: purchase_order__details {
    type: string
    hidden: yes
    sql: purchase_order__details ;;
  }

  dimension: purchase_price {
    type: number
    sql: purchasePrice ;;
  }

  dimension: purchase_price_currency {
    type: string
    sql: purchasePriceCurrency ;;
  }

  dimension: quantity_goods_in_kind_ordered {
    type: number
    sql: quantityGoodsInKindOrdered ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: quantityOrdered ;;
  }

  dimension: reference_product_id {
    type: string
    sql: referenceProductId ;;
  }

  dimension: retail_price__amount {
    type: number
    sql: ${TABLE}.retailPrice.amount ;;
    group_label: "Retail Price"
    group_item_label: "Amount"
  }

  dimension: retail_price__currency {
    type: string
    sql: ${TABLE}.retailPrice.currency ;;
    group_label: "Retail Price"
    group_item_label: "Currency"
  }

  dimension: sap_details__position {
    type: number
    sql: ${TABLE}.sapDetails.position ;;
    group_label: "Sap Details"
    group_item_label: "Position"
  }
}

view: purchase_order__header__involved_parties {
  dimension: location {
    type: number
    sql: ${TABLE}.location ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.locationType ;;
  }
}
