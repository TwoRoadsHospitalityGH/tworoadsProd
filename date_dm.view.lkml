view: date_dm {
  sql_table_name: pedw.fact.DATE_DM ;;

  dimension: date_sid {
    sql:  ${TABLE}.DATE_SID ;;
    hidden: yes
  }

  dimension: fiscal_period_label {
    label: "Name"
    type: string
    sql: to_char( ${TABLE}.cal_dt, 'mm Mon-yy' ) ;;
    drill_fields: [property_dm.property_ds*]
  }

  dimension_group: cal {
    type: time
    timeframes: [
      raw
      ,date
      ,month
      ,month_num
      ,quarter
      ,quarter_of_year
      ,year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cal_dt ;;
    drill_fields: [property_dm.property_ds*]
  }

  dimension: cal_ptd_bt {
    label: "Period-to-Date"
    description: "Restrict to Completed Periods Only"
    type: yesno
    sql: ${TABLE}.cal_ptd_bt = 1 ;;
  }

  dimension: current_period_wtd {
    label: "Current Week"
    group_label: "QTD,YTD"
    type: yesno
    sql: ${TABLE}.cal_dt < current_date() and date_trunc( week, ${TABLE}.cal_dt ) = date_trunc( week, dateadd( day, -1, current_date() ) );;
    hidden: yes
  }

  dimension: current_period_mtd {
    label: "Current Month"
    group_label: "QTD,YTD"
    type: yesno
    sql: ${TABLE}.cal_dt < current_date() and date_trunc( month, ${TABLE}.cal_dt ) = date_trunc( month, dateadd( day, -1, current_date() ) );;
    hidden: yes
  }

  #
  # restrict to up through prior month
  #
  filter: current_period_qtd {
    label: "Quarter-to-Date"
    group_label: "QTD,YTD"
    description: "Quarter of last complete month."
    type: yesno
    sql: ${TABLE}.cal_dt < date_trunc( month, current_date() ) and date_trunc( quarter, ${TABLE}.cal_dt ) = date_trunc( quarter, dateadd( month, -1, current_date() ) );;
    hidden: no
  }

  filter: current_period_ytd {
    label: "Year-to-Date"
    group_label: "QTD,YTD"
    description: "Year of last complete month."
    type: yesno
    sql: ${TABLE}.cal_dt < date_trunc( month, current_date() ) and date_trunc( year, ${TABLE}.cal_dt ) = date_trunc( year, dateadd( month, -1, current_date() ) );;
    hidden: no
  }


}
