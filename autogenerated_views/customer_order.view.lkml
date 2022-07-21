view: customer_order {
  sql_table_name: `mms-plg-looker-poc-a.sales_order.sales_order`
    ;;

  dimension: ap_fingerprint {
    type: number
    sql: ${TABLE}.ap_fingerprint ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by_user {
    type: string
    sql: ${TABLE}.created_by_user ;;
  }

  dimension_group: customer_purchase_order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.customer_purchase_order_date ;;
  }

  dimension: customer_purchase_order_type {
    type: string
    sql: ${TABLE}.customer_purchase_order_type ;;
  }

  dimension: delivery_block_reason {
    type: string
    sql: ${TABLE}.delivery_block_reason ;;
  }

  dimension_group: delta {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delta_date ;;
  }

  dimension: di_operation_type {
    type: string
    sql: ${TABLE}.di_operation_type ;;
  }

  dimension: di_sequence_number {
    type: number
    sql: ${TABLE}.di_sequence_number ;;
  }

  dimension: distribution_channel {
    type: string
    sql: ${TABLE}.distribution_channel ;;
  }

  dimension: header_billing_block_reason {
    type: string
    sql: ${TABLE}.header_billing_block_reason ;;
  }

  dimension_group: last_change {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_change_date ;;
  }

  dimension_group: last_change_datetime {
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
    sql: ${TABLE}.last_change_datetime ;;
  }

  dimension: last_changed_by_user {
    type: string
    sql: ${TABLE}.last_changed_by_user ;;
  }

  dimension: odq_change_mode {
    type: string
    sql: ${TABLE}.odq_change_mode ;;
  }

  dimension: odq_entity_cntr {
    type: number
    sql: ${TABLE}.odq_entity_cntr ;;
  }

  dimension: organization_division {
    type: string
    sql: ${TABLE}.organization_division ;;
  }

  dimension: outlet_id {
    type: string
    sql: ${TABLE}.outlet_id ;;
  }

  dimension: overall_delivery_confirmation_status {
    type: string
    sql: ${TABLE}.overall_delivery_confirmation_status ;;
  }

  dimension: overall_sd_process_status {
    type: string
    sql: ${TABLE}.overall_sd_process_status ;;
  }

  dimension: overall_total_delivery_status {
    type: string
    sql: ${TABLE}.overall_total_delivery_status ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension_group: requested_delivery {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.requested_delivery_date ;;
  }

  dimension: sales_document {
    type: string
    sql: ${TABLE}.sales_document ;;
  }

  dimension_group: sales_document {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_document_date ;;
  }

  dimension: sales_document_numeric {
    type: number
    sql: ${TABLE}.sales_document_numeric ;;
  }

  dimension: sales_document_processing_type {
    type: string
    sql: ${TABLE}.sales_document_processing_type ;;
  }

  dimension: sales_document_type {
    type: string
    sql: ${TABLE}.sales_document_type ;;
  }

  dimension: sales_group {
    type: string
    sql: ${TABLE}.sales_group ;;
  }

  dimension: sales_office {
    type: string
    sql: ${TABLE}.sales_office ;;
  }

  dimension: sales_organization {
    type: string
    sql: ${TABLE}.sales_organization ;;
  }

  dimension: sap_job_run_id {
    type: string
    sql: ${TABLE}.sap_job_run_id ;;
  }

  dimension: sd_document_category {
    type: string
    sql: ${TABLE}.sd_document_category ;;
  }

  dimension: sd_document_reason {
    type: string
    sql: ${TABLE}.sd_document_reason ;;
  }

  dimension: shipping_condition {
    type: string
    sql: ${TABLE}.shipping_condition ;;
  }

  dimension: sold_to_party {
    type: string
    sql: ${TABLE}.sold_to_party ;;
  }

  dimension: total_net_amount {
    type: number
    sql: ${TABLE}.total_net_amount ;;
  }

  dimension: transaction_currency {
    type: string
    sql: ${TABLE}.transaction_currency ;;
  }

  dimension: your_reference {
    type: string
    sql: ${TABLE}.your_reference ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
