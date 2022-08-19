include: "/autogenerated_views/sales_order.view.lkml"

view: +sales_order {

  dimension: order_number {
    type: number
    sql: cast (${TABLE}.orderNumber as integer) ;;
  }

}

view: +sales_order__discounts {
}

view: +sales_order__order_details {
}

view: +sales_order__involved_systems {
}

view: +sales_order__payment_information {
}

view: +sales_order__totals__vat_values__vat_value {
}

view: +sales_order__order_details__discounts {
}

view: +sales_order__totals__vat_values__vat_value__vat_value {
}

view: +sales_order__order_details__order_line_reservations {
}

view: +sales_order__order_details__shipping_information__discounts {
}

view: +sales_order__order_details__product_information__feature_information {
}

view: +sales_order__shipping_cost_scaling_list__shipping_cost_scaling {
}

view: +sales_order__shipping_cost_scaling_list__shipping_cost_scaling__scaling_values {
}