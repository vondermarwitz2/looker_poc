include: "/derived_tables/anomaly_alert.view.lkml"
include: "/refined_views/sales_order_all_r.view.lkml"
include: "/explores/sales_order.explore.lkml"
include: "/autogenerated_views/sales_order.view.lkml"

explore: anomaly_alert {
  persist_with: anomaly_alert
}