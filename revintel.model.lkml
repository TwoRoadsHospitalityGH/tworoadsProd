connection: "edw"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: revintel_daily_booking_rpt {

  persist_for: "10 minutes"

  label: "Revintel Test"
  view_label: "1) Measures"

}
