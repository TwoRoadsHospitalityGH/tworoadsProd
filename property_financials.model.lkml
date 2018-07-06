connection: "edw"

include: "*.view"         # include all the views
include: "*.dashboard"    # include all the dashboards

explore: gl_balance_rpt {
  persist_for: "0 minutes"

  label: "Property Financials"
#   access_filter: {
#     field: property_dm.property_key
#     user_attribute: property_access
#   }
  view_label: "1) Measures"


  join: property_dm {
    view_label: "Property"
    sql_on: ${gl_balance_rpt.property_key} = ${property_dm.property_key} ;;
    type: inner
    relationship: many_to_one
  }

  join: date_dm {
    view_label: "2) Period"
    sql_on: ${gl_balance_rpt.date_sid} = ${date_dm.date_sid} ;;
    type: inner
    relationship: many_to_one
  }

  join: gl_account_dm {
    view_label: "GL Account"
    sql_on: ${gl_balance_rpt.gl_account_sid} = ${gl_account_dm.gl_account_sid} ;;
    type: inner
    relationship: many_to_one
  }
}
