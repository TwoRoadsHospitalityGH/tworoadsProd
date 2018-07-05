view: property_dm {
  sql_table_name: pedw.fact.PROPERTY_DM ;;

  dimension: property_key {
    type: string
    sql: ${TABLE}.PROPERTY_KEY ;;
    hidden: no
  }

  dimension: proper_name {
    type: string
    sql: ${TABLE}.PROPER_NAME ;;
    drill_fields: [property_ds*]

    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+about&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain={{ value }}"
    }

    link: {
      label: "{{value}} Analytics Dashboard"
      url: "/dashboards/3?Property%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }

  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.SHORT_NAME ;;
  }

  dimension: marketing_name {
    type: string
    sql: ${TABLE}.MARKETING_NAME ;;
    drill_fields: [property_ds*]
  }

  dimension: brand_cd {
    type: string
    sql: ${TABLE}.brand_cd ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
    drill_fields: [property_ds*]
  }

  dimension: address {
    type: string
    sql: ${TABLE}.ADDRESS ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.CITY_NAME ;;
  }

  dimension: state_province_cd {
    type: string
    sql: ${TABLE}.STATE_PROVINCE_CD ;;
  }

  dimension: state_province_name {
    type: string
    sql: ${TABLE}.STATE_PROVINCE_NAME ;;
  }

  dimension: zip_cd {
    type: string
    sql: ${TABLE}.ZIP_CD ;;
  }

  dimension: property_lat {
    type: number
    sql: ${TABLE}.latitude ;;
    hidden: yes
  }

  dimension: property_long {
    type: number
    sql: ${TABLE}.longitude ;;
    hidden: yes
  }

  dimension: property_location {
    type: location
    sql_latitude: ${property_lat} ;;
    sql_longitude: ${property_long} ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.COUNTRY_NAME ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.REGION_NAME ;;
    drill_fields: [property_ds*]
  }

  dimension: location_type_name {
    type: string
    sql: ${TABLE}.location_type_name ;;
  }

  dimension: ownership_group_name {
    type: string
    sql: ${TABLE}.ownership_group_name ;;
  }

  dimension: evp_full_last_first {
    label: "EVP Name"
    type: string
    sql: ${TABLE}.evp_full_last_first ;;
  }

  dimension: phone_no {
    type: string
    sql: ${TABLE}.PHONE_NO ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.WEBSITE_URL ;;
  }

  dimension: opening_dt {
    type: date
    sql: ${TABLE}.opening_dt ;;
  }

  dimension: transition_dt {
    type: date
    sql: ${TABLE}.transition_dt ;;
  }

  dimension: same_store_financial_fl {
    label: "Same Store Financial"
    type: yesno
    sql: ${TABLE}.same_store_financial_fl = 'Y' ;;
  }

  dimension: same_store_revenue_fl {
    label: "Same Store Revenue"
    type: yesno
    sql: ${TABLE}.same_store_revenue_fl = 'Y' ;;
  }

  dimension: closed_fl {
    label: "Closed"
    type: yesno
    sql: ${TABLE}.closed_fl = 'Y' ;;
  }

  dimension: active_fl {
    label: "Active"
    type: yesno
    sql: ${TABLE}.active_fl = 'Y' ;;
  }

  #--------------

  # ----- Sets of fields for drilling ------
  set: property_ds {
    fields: [
      brand_name,
      proper_name,
      gl_account_dm.seg2_department_name,
      gl_account_dm.seg2_subdepartment_name,
      date_dm.fiscal_period_label,
      ownership_group_name,
      marketing_name,
      region_name
    ]
  }
}
