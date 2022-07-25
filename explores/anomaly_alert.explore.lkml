include: "/derived_tables/anomaly_alert.view.lkml"

explore: anomaly_alert {
  persist_with: anomaly_alert
}
