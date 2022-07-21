# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: sales_order {
  hidden: yes

  join: sales_order__discounts {
    view_label: "Sales Order: Discounts"
    sql: LEFT JOIN UNNEST(${sales_order.discounts}) as sales_order__discounts ;;
    relationship: one_to_many
  }

  join: sales_order__order_details {
    view_label: "Sales Order: Orderdetails"
    sql: LEFT JOIN UNNEST(${sales_order.order_details}) as sales_order__order_details ;;
    relationship: one_to_many
  }

  join: sales_order__involved_systems {
    view_label: "Sales Order: Involvedsystems"
    sql: LEFT JOIN UNNEST(${sales_order.involved_systems}) as sales_order__involved_systems ;;
    relationship: one_to_many
  }

  join: sales_order__payment_information {
    view_label: "Sales Order: Paymentinformation"
    sql: LEFT JOIN UNNEST(${sales_order.payment_information}) as sales_order__payment_information ;;
    relationship: one_to_many
  }

  join: sales_order__totals__vat_values__vat_value {
    view_label: "Sales Order: Totals Vatvalues Vatvalue"
    sql: LEFT JOIN UNNEST(${sales_order.totals__vat_values__vat_value}) as sales_order__totals__vat_values__vat_value ;;
    relationship: one_to_many
  }

  join: sales_order__order_details__discounts {
    view_label: "Sales Order: Orderdetails Discounts"
    sql: LEFT JOIN UNNEST(${sales_order__order_details.discounts}) as sales_order__order_details__discounts ;;
    relationship: one_to_many
  }

  join: sales_order__totals__vat_values__vat_value__vat_value {
    view_label: "Sales Order: Totals Vatvalues Vatvalue Vatvalue"
    sql: LEFT JOIN UNNEST(${sales_order__totals__vat_values__vat_value.vat_value}) as sales_order__totals__vat_values__vat_value__vat_value ;;
    relationship: one_to_many
  }

  join: sales_order__order_details__order_line_reservations {
    view_label: "Sales Order: Orderdetails Orderlinereservations"
    sql: LEFT JOIN UNNEST(${sales_order__order_details.order_line_reservations}) as sales_order__order_details__order_line_reservations ;;
    relationship: one_to_many
  }

  join: sales_order__order_details__shipping_information__discounts {
    view_label: "Sales Order: Orderdetails Shippinginformation Discounts"
    sql: LEFT JOIN UNNEST(${sales_order__order_details.shipping_information__discounts}) as sales_order__order_details__shipping_information__discounts ;;
    relationship: one_to_many
  }

  join: sales_order__order_details__product_information__feature_information {
    view_label: "Sales Order: Orderdetails Productinformation Featureinformation"
    sql: LEFT JOIN UNNEST(${sales_order__order_details.product_information__feature_information}) as sales_order__order_details__product_information__feature_information ;;
    relationship: one_to_many
  }

  join: sales_order__shipping_cost_scaling_list__shipping_cost_scaling {
    view_label: "Sales Order: Shippingcostscalinglist Shippingcostscaling"
    sql: LEFT JOIN UNNEST(${sales_order.shipping_cost_scaling_list__shipping_cost_scaling}) as sales_order__shipping_cost_scaling_list__shipping_cost_scaling ;;
    relationship: one_to_many
  }

  join: sales_order__shipping_cost_scaling_list__shipping_cost_scaling__scaling_values {
    view_label: "Sales Order: Shippingcostscalinglist Shippingcostscaling Scalingvalues"
    sql: LEFT JOIN UNNEST(${sales_order__shipping_cost_scaling_list__shipping_cost_scaling.scaling_values}) as sales_order__shipping_cost_scaling_list__shipping_cost_scaling__scaling_values ;;
    relationship: one_to_many
  }
}

view: sales_order {
  sql_table_name: `mms-plg-looker-poc-a.SalesOrder.SalesOrder`
    ;;

  dimension: address_addition {
    type: string
    sql: ${TABLE}.address_addition ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: contract_partner_id {
    type: number
    sql: ${TABLE}.contractPartnerId ;;
  }

  dimension_group: create {
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
    sql: ${TABLE}.createTime ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerId ;;
  }

  dimension: delivery_details__carrier {
    type: string
    sql: ${TABLE}.deliveryDetails.carrier ;;
    group_label: "Delivery Details"
    group_item_label: "Carrier"
  }

  dimension: delivery_details__customer_requested_delivery_type {
    type: string
    sql: ${TABLE}.deliveryDetails.customerRequestedDeliveryType ;;
    group_label: "Delivery Details"
    group_item_label: "Customer Requested Delivery Type"
  }

  dimension: delivery_details__delivery_type {
    type: string
    sql: ${TABLE}.deliveryDetails.deliveryType ;;
    group_label: "Delivery Details"
    group_item_label: "Delivery Type"
  }

  dimension: delivery_details__outlet_address__address_field_1 {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.addressField_1 ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Address Field 1"
  }

  dimension: delivery_details__outlet_address__address_field_2 {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.addressField_2 ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Address Field 2"
  }

  dimension: delivery_details__outlet_address__address_field_3 {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.addressField_3 ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Address Field 3"
  }

  dimension: delivery_details__outlet_address__city {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.city ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "City"
  }

  dimension: delivery_details__outlet_address__country {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.country ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Country"
  }

  dimension: delivery_details__outlet_address__fax_number {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.faxNumber ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Fax Number"
  }

  dimension: delivery_details__outlet_address__phone_number {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.phoneNumber ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Phone Number"
  }

  dimension: delivery_details__outlet_address__zip_code_1 {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.zipCode_1 ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Zip Code 1"
  }

  dimension: delivery_details__outlet_address__zip_code_2 {
    type: string
    sql: ${TABLE}.deliveryDetails.outletAddress.zipCode_2 ;;
    group_label: "Delivery Details Outlet Address"
    group_item_label: "Zip Code 2"
  }

  dimension: delivery_details__pickup_outlet_id {
    type: number
    sql: ${TABLE}.deliveryDetails.pickupOutletId ;;
    group_label: "Delivery Details"
    group_item_label: "Pickup Outlet ID"
  }

  dimension: delivery_details__pickup_outlet_name {
    type: string
    sql: ${TABLE}.deliveryDetails.pickupOutletName ;;
    group_label: "Delivery Details"
    group_item_label: "Pickup Outlet Name"
  }

  dimension: delivery_details__shipping_type {
    type: string
    sql: ${TABLE}.deliveryDetails.shippingType ;;
    group_label: "Delivery Details"
    group_item_label: "Shipping Type"
  }

  dimension: discounts {
    hidden: yes
    sql: ${TABLE}.discounts ;;
  }

  dimension: document_type {
    type: string
    sql: ${TABLE}.documentType ;;
  }

  dimension: email_flag {
    type: yesno
    sql: ${TABLE}.emailFlag ;;
  }

  dimension: external_source {
    type: string
    sql: ${TABLE}.externalSource ;;
  }

  dimension: involved_systems {
    hidden: yes
    sql: ${TABLE}.involvedSystems ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: loyalty__is_loyalty_member {
    type: yesno
    sql: ${TABLE}.loyalty.isLoyaltyMember ;;
    group_label: "Loyalty"
    group_item_label: "Is Loyalty Member"
  }

  dimension: loyalty__win {
    type: yesno
    sql: ${TABLE}.loyalty.win ;;
    group_label: "Loyalty"
    group_item_label: "Win"
  }

  dimension: notes__note_text {
    type: string
    sql: ${TABLE}.notes.noteText ;;
    group_label: "Notes"
    group_item_label: "Note Text"
  }

  dimension: notes__reason_code {
    type: string
    sql: ${TABLE}.notes.reasonCode ;;
    group_label: "Notes"
    group_item_label: "Reason Code"
  }

  dimension: order_details {
    hidden: yes
    sql: ${TABLE}.orderDetails ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.orderNumber ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.orderType ;;
  }

  dimension: outlet_id {
    type: number
    sql: ${TABLE}.outletId ;;
  }

  dimension: payment_information {
    hidden: yes
    sql: ${TABLE}.paymentInformation ;;
  }

  dimension: processing_information {
    type: number
    sql: ${TABLE}.processingInformation ;;
  }

  dimension: retail_price_incl_duties {
    type: yesno
    sql: ${TABLE}.retailPriceInclDuties ;;
  }

  dimension: sfss {
    type: yesno
    sql: ${TABLE}.sfss ;;
  }

  dimension: shipping_cost_calculation_type {
    type: string
    sql: ${TABLE}.shippingCostCalculationType ;;
  }

  dimension: shipping_cost_scaling_list__shipping_cost_scaling {
    hidden: yes
    sql: ${TABLE}.shippingCostScalingList.shippingCostScaling ;;
    group_label: "Shipping Cost Scaling List"
    group_item_label: "Shipping Cost Scaling"
  }

  dimension: so_insert_id {
    type: string
    sql: ${TABLE}.so_insert_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: source_order_number {
    type: number
    sql: ${TABLE}.sourceOrderNumber ;;
  }

  dimension: subsidiary {
    type: string
    sql: ${TABLE}.subsidiary ;;
  }

  dimension: tax_id {
    type: string
    sql: ${TABLE}.taxId ;;
  }

  dimension: totals__gross_total__amount {
    type: number
    sql: ${TABLE}.totals.grossTotal.amount ;;
    group_label: "Totals Gross Total"
    group_item_label: "Amount"
  }

  dimension: totals__gross_total__currency {
    type: string
    sql: ${TABLE}.totals.grossTotal.currency ;;
    group_label: "Totals Gross Total"
    group_item_label: "Currency"
  }

  dimension: totals__gross_total_excl_tributes__amount {
    type: number
    sql: ${TABLE}.totals.grossTotalExclTributes.amount ;;
    group_label: "Totals Gross Total Excl Tributes"
    group_item_label: "Amount"
  }

  dimension: totals__gross_total_excl_tributes__currency {
    type: string
    sql: ${TABLE}.totals.grossTotalExclTributes.currency ;;
    group_label: "Totals Gross Total Excl Tributes"
    group_item_label: "Currency"
  }

  dimension: totals__net_total__amount {
    type: number
    sql: ${TABLE}.totals.netTotal.amount ;;
    group_label: "Totals Net Total"
    group_item_label: "Amount"
  }

  dimension: totals__net_total__currency {
    type: string
    sql: ${TABLE}.totals.netTotal.currency ;;
    group_label: "Totals Net Total"
    group_item_label: "Currency"
  }

  dimension: totals__original_total__amount {
    type: number
    sql: ${TABLE}.totals.originalTotal.amount ;;
    group_label: "Totals Original Total"
    group_item_label: "Amount"
  }

  dimension: totals__original_total__currency {
    type: string
    sql: ${TABLE}.totals.originalTotal.currency ;;
    group_label: "Totals Original Total"
    group_item_label: "Currency"
  }

  dimension: totals__vat_values__vat_value {
    hidden: yes
    sql: ${TABLE}.totals.vatValues.vatValue ;;
    group_label: "Totals Vat Values"
    group_item_label: "Vat Value"
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [delivery_details__pickup_outlet_name]
  }
}

view: sales_order__discounts {
  dimension: description {
    type: string
    sql: description ;;
  }

  dimension: discount_amount__amount {
    type: number
    sql: ${TABLE}.discountAmount.amount ;;
    group_label: "Discount Amount"
    group_item_label: "Amount"
  }

  dimension: discount_amount__currency {
    type: string
    sql: ${TABLE}.discountAmount.currency ;;
    group_label: "Discount Amount"
    group_item_label: "Currency"
  }

  dimension: discount_code {
    type: string
    sql: discountCode ;;
  }

  dimension: discount_name {
    type: string
    sql: discountName ;;
  }

  dimension: discount_type {
    type: string
    sql: discountType ;;
  }

  dimension: qualifier {
    type: string
    sql: qualifier ;;
  }

  dimension: sales_order__discounts {
    type: string
    hidden: yes
    sql: sales_order__discounts ;;
  }
}

view: sales_order__order_details {
  dimension: campaign_code {
    type: string
    sql: campaignCode ;;
  }

  dimension: delivery_split_indicator {
    type: number
    sql: deliverySplitIndicator ;;
  }

  dimension: delivery_time_cluster {
    type: string
    sql: deliveryTimeCluster ;;
  }

  dimension: discounts {
    hidden: yes
    sql: ${TABLE}.discounts ;;
  }

  dimension_group: edd__calculated_delivery {
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
    sql: ${TABLE}.EDD.calculatedDeliveryDate ;;
  }

  dimension: edd__calculation_base {
    type: string
    sql: ${TABLE}.EDD.calculationBase ;;
    group_label: "Edd"
    group_item_label: "Calculation Base"
  }

  dimension: estimated_delivery_date__replenishment_buffer {
    type: string
    sql: ${TABLE}.estimatedDeliveryDate.replenishmentBuffer ;;
    group_label: "Estimated Delivery Date"
    group_item_label: "Replenishment Buffer"
  }

  dimension: estimated_delivery_date__replenishment_lead_time {
    type: number
    sql: ${TABLE}.estimatedDeliveryDate.replenishmentLeadTime ;;
    group_label: "Estimated Delivery Date"
    group_item_label: "Replenishment Lead Time"
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
    sql: expectedDeliveryDate ;;
  }

  dimension: line_item_number {
    type: string
    sql: lineItemNumber ;;
  }

  dimension: line_type {
    type: string
    sql: lineType ;;
  }

  dimension: order_line_reservations {
    hidden: yes
    sql: orderLineReservations ;;
  }

  dimension: original_total_line_item_price__amount {
    type: number
    sql: ${TABLE}.originalTotalLineItemPrice.amount ;;
    group_label: "Original Total Line Item Price"
    group_item_label: "Amount"
  }

  dimension: original_total_line_item_price__currency {
    type: string
    sql: ${TABLE}.originalTotalLineItemPrice.currency ;;
    group_label: "Original Total Line Item Price"
    group_item_label: "Currency"
  }

  dimension: original_unit_price__amount {
    type: number
    sql: ${TABLE}.originalUnitPrice.amount ;;
    group_label: "Original Unit Price"
    group_item_label: "Amount"
  }

  dimension: original_unit_price__currency {
    type: string
    sql: ${TABLE}.originalUnitPrice.currency ;;
    group_label: "Original Unit Price"
    group_item_label: "Currency"
  }

  dimension: original_unit_price_incl_tributes__amount {
    type: number
    sql: ${TABLE}.originalUnitPriceInclTributes.amount ;;
    group_label: "Original Unit Price Incl Tributes"
    group_item_label: "Amount"
  }

  dimension: original_unit_price_incl_tributes__currency {
    type: string
    sql: ${TABLE}.originalUnitPriceInclTributes.currency ;;
    group_label: "Original Unit Price Incl Tributes"
    group_item_label: "Currency"
  }

  dimension: prime_line_no {
    type: string
    sql: primeLineNo ;;
  }

  dimension: product_information__brand {
    type: string
    sql: ${TABLE}.productInformation.brand ;;
    group_label: "Product Information"
    group_item_label: "Brand"
  }

  dimension: product_information__ean {
    type: string
    sql: ${TABLE}.productInformation.ean ;;
    group_label: "Product Information"
    group_item_label: "Ean"
  }

  dimension: product_information__feature_information {
    hidden: yes
    sql: ${TABLE}.productInformation.featureInformation ;;
    group_label: "Product Information"
    group_item_label: "Feature Information"
  }

  dimension: product_information__id {
    type: number
    sql: ${TABLE}.productInformation.id ;;
    group_label: "Product Information"
    group_item_label: "ID"
  }

  dimension: product_information__item_description {
    type: string
    sql: ${TABLE}.productInformation.itemDescription ;;
    group_label: "Product Information"
    group_item_label: "Item Description"
  }

  dimension: product_information__name {
    type: string
    sql: ${TABLE}.productInformation.name ;;
    group_label: "Product Information"
    group_item_label: "Name"
  }

  dimension: product_information__product_type {
    type: string
    sql: ${TABLE}.productInformation.productType ;;
    group_label: "Product Information"
    group_item_label: "Product Type"
  }

  dimension_group: product_information__release {
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
    sql: ${TABLE}.productInformation.releaseDate ;;
  }

  dimension: product_information__vat_key {
    type: number
    sql: ${TABLE}.productInformation.vatKey ;;
    group_label: "Product Information"
    group_item_label: "Vat Key"
  }

  dimension: product_information__vat_rate_product {
    type: number
    sql: ${TABLE}.productInformation.vatRateProduct ;;
    group_label: "Product Information"
    group_item_label: "Vat Rate Product"
  }

  dimension: quantities__available_quantity {
    type: number
    sql: ${TABLE}.quantities.availableQuantity ;;
    group_label: "Quantities"
    group_item_label: "Available Quantity"
  }

  dimension: quantities__ordered_quantity {
    type: string
    sql: ${TABLE}.quantities.orderedQuantity ;;
    group_label: "Quantities"
    group_item_label: "Ordered Quantity"
  }

  dimension: quantities__unit_of_measure {
    type: string
    sql: ${TABLE}.quantities.unitOfMeasure ;;
    group_label: "Quantities"
    group_item_label: "Unit of Measure"
  }

  dimension: reference_line_item_number {
    type: string
    sql: referenceLineItemNumber ;;
  }

  dimension: req_ship_date {
    type: string
    sql: reqShipDate ;;
  }

  dimension_group: reservation_node_ship {
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
    sql: reservationNodeShipDate ;;
  }

  dimension: sales_order__order_details {
    type: string
    hidden: yes
    sql: sales_order__order_details ;;
  }

  dimension: shipping_class_information__shipping_cost_class {
    type: number
    sql: ${TABLE}.shippingClassInformation.shippingCostClass ;;
    group_label: "Shipping Class Information"
    group_item_label: "Shipping Cost Class"
  }

  dimension: shipping_class_information__shipping_cost_class_amount__amount {
    type: number
    sql: ${TABLE}.shippingClassInformation.shippingCostClassAmount.amount ;;
    group_label: "Shipping Class Information Shipping Cost Class Amount"
    group_item_label: "Amount"
  }

  dimension: shipping_class_information__shipping_cost_class_amount__currency {
    type: string
    sql: ${TABLE}.shippingClassInformation.shippingCostClassAmount.currency ;;
    group_label: "Shipping Class Information Shipping Cost Class Amount"
    group_item_label: "Currency"
  }

  dimension: shipping_class_information__shipping_cost_class_distribution_type {
    type: string
    sql: ${TABLE}.shippingClassInformation.shippingCostClassDistributionType ;;
    group_label: "Shipping Class Information"
    group_item_label: "Shipping Cost Class Distribution Type"
  }

  dimension: shipping_information__discounts {
    hidden: yes
    sql: ${TABLE}.shippingInformation.discounts ;;
    group_label: "Shipping Information"
    group_item_label: "Discounts"
  }

  dimension: shipping_information__shipping_costs__amount {
    type: number
    sql: ${TABLE}.shippingInformation.shippingCosts.amount ;;
    group_label: "Shipping Information Shipping Costs"
    group_item_label: "Amount"
  }

  dimension: shipping_information__shipping_costs__currency {
    type: string
    sql: ${TABLE}.shippingInformation.shippingCosts.currency ;;
    group_label: "Shipping Information Shipping Costs"
    group_item_label: "Currency"
  }

  dimension: shipping_information__shipping_costs_net__amount {
    type: number
    sql: ${TABLE}.shippingInformation.shippingCostsNet.amount ;;
    group_label: "Shipping Information Shipping Costs Net"
    group_item_label: "Amount"
  }

  dimension: shipping_information__shipping_costs_net__currency {
    type: string
    sql: ${TABLE}.shippingInformation.shippingCostsNet.currency ;;
    group_label: "Shipping Information Shipping Costs Net"
    group_item_label: "Currency"
  }

  dimension: shipping_information__shipping_costs_vat_price__amount {
    type: number
    sql: ${TABLE}.shippingInformation.shippingCostsVatPrice.amount ;;
    group_label: "Shipping Information Shipping Costs Vat Price"
    group_item_label: "Amount"
  }

  dimension: shipping_information__shipping_costs_vat_price__currency {
    type: string
    sql: ${TABLE}.shippingInformation.shippingCostsVatPrice.currency ;;
    group_label: "Shipping Information Shipping Costs Vat Price"
    group_item_label: "Currency"
  }

  dimension: shipping_information__shipping_type {
    type: string
    sql: ${TABLE}.shippingInformation.shippingType ;;
    group_label: "Shipping Information"
    group_item_label: "Shipping Type"
  }

  dimension: shipping_information__vat_key {
    type: number
    sql: ${TABLE}.shippingInformation.vatKey ;;
    group_label: "Shipping Information"
    group_item_label: "Vat Key"
  }

  dimension: shipping_information__vat_rate_shipping {
    type: number
    sql: ${TABLE}.shippingInformation.vatRateShipping ;;
    group_label: "Shipping Information"
    group_item_label: "Vat Rate Shipping"
  }

  dimension: sub_line_no {
    type: string
    sql: subLineNo ;;
  }

  dimension: total_line_item_price__amount {
    type: number
    sql: ${TABLE}.totalLineItemPrice.amount ;;
    group_label: "Total Line Item Price"
    group_item_label: "Amount"
  }

  dimension: total_line_item_price__currency {
    type: string
    sql: ${TABLE}.totalLineItemPrice.currency ;;
    group_label: "Total Line Item Price"
    group_item_label: "Currency"
  }

  dimension: total_line_item_price_net__amount {
    type: number
    sql: ${TABLE}.totalLineItemPriceNet.amount ;;
    group_label: "Total Line Item Price Net"
    group_item_label: "Amount"
  }

  dimension: total_line_item_price_net__currency {
    type: string
    sql: ${TABLE}.totalLineItemPriceNet.currency ;;
    group_label: "Total Line Item Price Net"
    group_item_label: "Currency"
  }

  dimension: total_line_item_price_net_incl_tributes__amount {
    type: number
    sql: ${TABLE}.totalLineItemPriceNetInclTributes.amount ;;
    group_label: "Total Line Item Price Net Incl Tributes"
    group_item_label: "Amount"
  }

  dimension: total_line_item_price_net_incl_tributes__currency {
    type: string
    sql: ${TABLE}.totalLineItemPriceNetInclTributes.currency ;;
    group_label: "Total Line Item Price Net Incl Tributes"
    group_item_label: "Currency"
  }

  dimension: total_line_item_vat_price__amount {
    type: number
    sql: ${TABLE}.totalLineItemVatPrice.amount ;;
    group_label: "Total Line Item Vat Price"
    group_item_label: "Amount"
  }

  dimension: total_line_item_vat_price__currency {
    type: string
    sql: ${TABLE}.totalLineItemVatPrice.currency ;;
    group_label: "Total Line Item Vat Price"
    group_item_label: "Currency"
  }

  dimension: unit_price__amount {
    type: number
    sql: ${TABLE}.unitPrice.amount ;;
    group_label: "Unit Price"
    group_item_label: "Amount"
  }

  dimension: unit_price__currency {
    type: string
    sql: ${TABLE}.unitPrice.currency ;;
    group_label: "Unit Price"
    group_item_label: "Currency"
  }

  dimension: unit_price_incl_tributes__amount {
    type: number
    sql: ${TABLE}.unitPriceInclTributes.amount ;;
    group_label: "Unit Price Incl Tributes"
    group_item_label: "Amount"
  }

  dimension: unit_price_incl_tributes__currency {
    type: string
    sql: ${TABLE}.unitPriceInclTributes.currency ;;
    group_label: "Unit Price Incl Tributes"
    group_item_label: "Currency"
  }

  dimension: unit_price_net__amount {
    type: number
    sql: ${TABLE}.unitPriceNet.amount ;;
    group_label: "Unit Price Net"
    group_item_label: "Amount"
  }

  dimension: unit_price_net__currency {
    type: string
    sql: ${TABLE}.unitPriceNet.currency ;;
    group_label: "Unit Price Net"
    group_item_label: "Currency"
  }

  dimension: unit_price_net_incl_tributes__amount {
    type: number
    sql: ${TABLE}.unitPriceNetInclTributes.amount ;;
    group_label: "Unit Price Net Incl Tributes"
    group_item_label: "Amount"
  }

  dimension: unit_price_net_incl_tributes__currency {
    type: string
    sql: ${TABLE}.unitPriceNetInclTributes.currency ;;
    group_label: "Unit Price Net Incl Tributes"
    group_item_label: "Currency"
  }

  dimension: vat_price__amount {
    type: number
    sql: ${TABLE}.vatPrice.amount ;;
    group_label: "Vat Price"
    group_item_label: "Amount"
  }

  dimension: vat_price__currency {
    type: string
    sql: ${TABLE}.vatPrice.currency ;;
    group_label: "Vat Price"
    group_item_label: "Currency"
  }
}

view: sales_order__involved_systems {
  dimension: key {
    type: string
    sql: key ;;
  }

  dimension: sales_order__involved_systems {
    type: string
    hidden: yes
    sql: sales_order__involved_systems ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

view: sales_order__payment_information {
  dimension: bank_name {
    type: string
    sql: bankName ;;
  }

  dimension: card_brand {
    type: string
    sql: cardBrand ;;
  }

  dimension: fraud_screening_status {
    type: string
    sql: fraudScreeningStatus ;;
  }

  dimension: merchant_id {
    type: string
    sql: merchantId ;;
  }

  dimension: method {
    type: string
    sql: method ;;
  }

  dimension: number {
    type: string
    sql: number ;;
  }

  dimension: pay_id {
    type: string
    sql: payId ;;
  }

  dimension: payment_service_provider_id {
    type: string
    sql: paymentServiceProviderId ;;
  }

  dimension: payment_service_provider_name {
    type: string
    sql: paymentServiceProviderName ;;
  }

  dimension: payment_transaction_type {
    type: string
    sql: paymentTransactionType ;;
  }

  dimension: reference_number {
    type: string
    sql: referenceNumber ;;
  }

  dimension: sales_order__payment_information {
    type: string
    hidden: yes
    sql: sales_order__payment_information ;;
  }

  dimension: status {
    type: string
    sql: status ;;
  }

  dimension: transaction_amount__amount {
    type: number
    sql: ${TABLE}.transactionAmount.amount ;;
    group_label: "Transaction Amount"
    group_item_label: "Amount"
  }

  dimension: transaction_amount__currency {
    type: string
    sql: ${TABLE}.transactionAmount.currency ;;
    group_label: "Transaction Amount"
    group_item_label: "Currency"
  }

  dimension: transaction_id {
    type: string
    sql: transactionId ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: valid_until {
    type: string
    sql: validUntil ;;
  }

  dimension: x_pay_id {
    type: number
    sql: xPayId ;;
  }

  dimension: xid {
    type: string
    sql: XID ;;
  }
}

view: sales_order__totals__vat_values__vat_value {
  dimension: vat_key {
    type: number
    sql: ${TABLE}.vatKey ;;
  }

  dimension: vat_percentage {
    type: number
    sql: ${TABLE}.vatPercentage ;;
  }

  dimension: vat_value {
    hidden: yes
    sql: ${TABLE}.vatValue ;;
  }
}

view: sales_order__order_details__discounts {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount__amount {
    type: number
    sql: ${TABLE}.discountAmount.amount ;;
    group_label: "Discount Amount"
    group_item_label: "Amount"
  }

  dimension: discount_amount__currency {
    type: string
    sql: ${TABLE}.discountAmount.currency ;;
    group_label: "Discount Amount"
    group_item_label: "Currency"
  }

  dimension: discount_amount_per_item__amount {
    type: number
    sql: ${TABLE}.discountAmountPerItem.amount ;;
    group_label: "Discount Amount per Item"
    group_item_label: "Amount"
  }

  dimension: discount_amount_per_item__currency {
    type: string
    sql: ${TABLE}.discountAmountPerItem.currency ;;
    group_label: "Discount Amount per Item"
    group_item_label: "Currency"
  }

  dimension: discount_name {
    type: string
    sql: ${TABLE}.discountName ;;
  }

  dimension: discount_type {
    type: string
    sql: ${TABLE}.discountType ;;
  }
}

view: sales_order__totals__vat_values__vat_value__vat_value {
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
}

view: sales_order__order_details__order_line_reservations {
  dimension: item_id {
    type: number
    sql: ${TABLE}.itemID ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension_group: requested_reservation {
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
    sql: ${TABLE}.requestedReservationDate ;;
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservationId ;;
  }

  dimension: ship_node {
    type: string
    sql: ${TABLE}.shipNode ;;
  }

  dimension: unit_of_measure {
    type: string
    sql: ${TABLE}.unitOfMeasure ;;
  }
}

view: sales_order__order_details__shipping_information__discounts {
  dimension: cost_center {
    type: string
    sql: ${TABLE}.costCenter ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_percentage {
    type: number
    sql: ${TABLE}.discountPercentage ;;
  }

  dimension: discount_type {
    type: string
    sql: ${TABLE}.discountType ;;
  }

  dimension: qualifier {
    type: string
    sql: ${TABLE}.qualifier ;;
  }
}

view: sales_order__order_details__product_information__feature_information {
  dimension: feature_id {
    type: string
    sql: ${TABLE}.featureId ;;
  }

  dimension: feature_label {
    type: string
    sql: ${TABLE}.featureLabel ;;
  }

  dimension: feature_value {
    type: string
    sql: ${TABLE}.featureValue ;;
  }
}

view: sales_order__shipping_cost_scaling_list__shipping_cost_scaling {
  dimension: scaling_values {
    hidden: yes
    sql: ${TABLE}.scalingValues ;;
  }

  dimension: shipping_cost_class {
    type: number
    sql: ${TABLE}.shippingCostClass ;;
  }
}

view: sales_order__shipping_cost_scaling_list__shipping_cost_scaling__scaling_values {
  dimension: position_number {
    type: number
    sql: ${TABLE}.positionNumber ;;
  }

  dimension: scaling_value {
    type: number
    sql: ${TABLE}.scalingValue ;;
  }
}
