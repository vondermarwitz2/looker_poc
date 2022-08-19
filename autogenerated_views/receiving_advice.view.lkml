# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: receiving_advice {
  hidden: yes

  join: receiving_advice__recadv__recadv_position {
    view_label: "Receiving Advice: Recadv Recadvposition"
    sql: LEFT JOIN UNNEST(${receiving_advice.recadv__recadv_position}) as receiving_advice__recadv__recadv_position ;;
    relationship: one_to_many
  }
}

view: receiving_advice {
  sql_table_name: `mms-plg-looker-poc-a.ReceivingAdvice.ReceivingAdvice`
    ;;

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insert_id ;;
  }

  dimension: message_receiver_id {
    type: string
    sql: ${TABLE}.messageReceiverId ;;
  }

  dimension: message_sender_id {
    type: number
    sql: ${TABLE}.messageSenderId ;;
  }

  dimension_group: message_timestamp {
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
    sql: ${TABLE}.messageTimestamp ;;
  }

  dimension_group: recadv__delivery_note {
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
    sql: ${TABLE}.recadv.deliveryNoteDate ;;
  }

  dimension: recadv__delivery_note_number {
    type: string
    sql: ${TABLE}.recadv.deliveryNoteNumber ;;
    group_label: "Recadv"
    group_item_label: "Delivery Note Number"
  }

  dimension: recadv__recadv_position {
    hidden: yes
    sql: ${TABLE}.recadv.recadvPosition ;;
    group_label: "Recadv"
    group_item_label: "Recadv Position"
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.transactionId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: receiving_advice__recadv__recadv_position {
  dimension_group: booking {
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
    sql: ${TABLE}.bookingDate ;;
  }

  dimension: external_order_id {
    type: string
    sql: ${TABLE}.externalOrderId ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}.orderDate ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.orderId ;;
  }

  dimension: order_position_id {
    type: number
    sql: ${TABLE}.orderPositionId ;;
  }

  dimension: packaging_unit {
    type: string
    sql: ${TABLE}.packagingUnit ;;
  }

  dimension: position_id {
    type: string
    sql: ${TABLE}.positionId ;;
  }

  dimension: product_ean {
    type: string
    sql: ${TABLE}.productEAN ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.productId ;;
  }

  dimension: quantity_booked {
    type: number
    sql: ${TABLE}.quantityBooked ;;
  }

  dimension: quantity_ordered {
    type: number
    sql: ${TABLE}.quantityOrdered ;;
  }

  dimension: stock_id {
    type: string
    sql: ${TABLE}.stockId ;;
  }
}
