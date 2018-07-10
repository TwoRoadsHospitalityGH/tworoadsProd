view: gl_account_dm {
  sql_table_name: pedw.fact.GL_ACCOUNT_DM ;;

  dimension: gl_account_sid {
    type: string
    sql: ${TABLE}.GL_ACCOUNT_SID ;;
    hidden: yes
  }
#   dimension: seg4_name {
#     type: string
#     sql: ${TABLE}.SEG4_NAME ;;
#   }
#
#   dimension: seg5_name {
#     type: string
#     sql: ${TABLE}.SEG5_NAME ;;
#   }

  dimension: segment1_cd {
    type: string
    sql: ${TABLE}.SEGMENT1_CD ;;
  }

  dimension: segment2_cd {
    type: string
    sql: ${TABLE}.SEGMENT2_CD ;;
  }

  dimension: segment3_cd {
    type: string
    sql: ${TABLE}.SEGMENT3_CD ;;
  }

  dimension: segment4_cd {
    type: string
    sql: ${TABLE}.SEGMENT4_CD ;;
  }

  dimension: segment5_cd {
    type: string
    sql: ${TABLE}.SEGMENT5_CD ;;
  }

  dimension: s2_type_name {
    label: "Department"
    type: string
    sql: ${TABLE}.S2_type_name ;;
    drill_fields: [gl_account_ds*,property_dm.property_ds*]
  }

#   dimension: s2_class_name {
#     label: "Department Class"
#     type: string
#     sql: ${TABLE}.S2_class_name ;;
#     drill_fields: [gl_account_ds*,property_dm.property_ds*]
#   }
#
#   dimension: s2_subclass_name {
#     label: "Department SubClass"
#     type: string
#     sql: ${TABLE}.S2_subclass_name ;;
#     drill_fields: [gl_account_ds*,property_dm.property_ds*]
#   }

  dimension: s3_type_name {
    label: "Major"
    type: string
    sql: ${TABLE}.S3_type_name ;;
    drill_fields: [gl_account_ds*,property_dm.property_ds*]
  }

  dimension: s3_class_name {
    label: "Major Class"
    type: string
    sql: ${TABLE}.S3_class_name ;;
    drill_fields: [gl_account_ds*,property_dm.property_ds*]
  }

#   dimension: s3_subclass_name {
#     label: "Major SubClass"
#     type: string
#     sql: ${TABLE}.S3_subclass_name ;;
#     drill_fields: [gl_account_ds*,property_dm.property_ds*]
#   }

  dimension: account_type{
    label: "Account Type"
    type: string
    sql: ${TABLE}.account_type_cd ;;
  }


  # ----- Sets of fields for drilling ------
  set: gl_account_ds {
    fields: [
      s2_type_name,
      s3_type_name
        ]
  }
}
