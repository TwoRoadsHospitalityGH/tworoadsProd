view: gl_balance_rpt {
  derived_table: {
    sql: select
          r.DATE_SID,
          r.PROPERTY_KEY,
          r.ACT_NET_DR_AMT,
          r.ACT_NET_CR_AMT,
          r.BGT_NET_DR_AMT,
          r.BGT_NET_CR_AMT,
          r.FCST_NET_DR_AMT,
          r.FCST_NET_CR_AMT,
          r.PRJC_NET_DR_AMT,
          r.PRJC_NET_CR_AMT,

          a.GL_ACCOUNT_SID,
          a.SEGMENT1_CD,
          a.SEGMENT2_CD,
          a.SEGMENT3_CD,
          a.SEGMENT4_CD,
          a.SEGMENT5_CD,
          a.SEG1_NAME,
          a.SEG2_OUTLET_NAME,
          a.SEG2_OUTLET_TYPE_NAME,
          a.SEG2_DEPARTMENT_NAME,
          a.SEG2_SUBDEPARTMENT_NAME,
          a.SEG3_CLASS_NAME,
          a.SEG3_SUBCLASS_NAME,
          a.SEG3_TYPE_CD,
          a.SEG4_NAME,
          a.SEG5_NAME,
          a.S2_TYPE_NAME,
          a.S2_CLASS_NAME,
          a.S2_SUBCLASS_NAME,
          a.S3_TYPE_NAME,
          a.S3_CLASS_NAME,
          a.S3_SUBCLASS_NAME,
          a.DW_LOAD_DT,
          a.DW_UPDATE_DT
       from
          PEDW.FACT.GL_BALANCE_RPT r
          JOIN PEDW.FACT.GL_ACCOUNT_DM a ON a.gl_account_sid = r.gl_account_sid ;;
  }

  dimension: date_sid {
    type: number
    value_format_name: id
    sql: ${TABLE}.DATE_SID ;;
    hidden: yes
  }

  dimension: gl_account_sid {
    type: string
    sql: ${TABLE}.GL_ACCOUNT_SID ;;
    hidden: yes
  }

  dimension: property_key {
    type: number
    sql: ${TABLE}.PROPERTY_KEY ;;
    hidden: yes
  }

  measure: act_net_dr_amt {
    label: "Actual Debit$"
    group_label: "Actual"
    description: "Actual Debit $"
    type: sum
    sql: ${TABLE}.act_net_dr_amt ;;
    value_format_name: usd_0
  }

  measure: act_net_cr_amt {
    label: "Actual Credit$"
    group_label: "Actual"
    description: "Actual Credit $"
    type: sum
    sql: ${TABLE}.act_net_cr_amt ;;
    value_format_name: usd_0
  }

  measure: act_net_amt {
    label: "Actual Balance$"
    group_label: "Actual"
    description: "Actual Balance $"
    type: number
    sql: CASE WHEN gl_account_dm.s2_type_name = 'Revenue' THEN ${act_net_cr_amt}-${act_net_dr_amt} ELSE ${act_net_dr_amt}-${act_net_cr_amt} END ;;
    drill_fields: [act_net_dr_amt, act_net_cr_amt]
    value_format_name: usd_0
  }

  measure: bgt_net_dr_amt {
    label: "Budget Debit$"
    group_label: "Budget"
    description: "Budget Debit $"
    type: sum
    sql: ${TABLE}.bgt_net_dr_amt ;;
    value_format_name: usd_0
  }

  measure: bgt_net_cr_amt {
    label: "Budget Credit$"
    group_label: "Budget"
    description: "Budget Credit $"
    type: sum
    sql: ${TABLE}.bgt_net_cr_amt ;;
    value_format_name: usd_0
  }

#   measure: bgt_net_amt {
#     label: "Budget Balance$"
#     group_label: "Budget"
#     description: "Budget Balance $"
#     type: number
#     sql: CASE WHEN ${TABLE}.s2_type_name = 'Revenue' THEN ${bgt_net_cr_amt}-${bgt_net_dr_amt} ELSE ${bgt_net_dr_amt}-${bgt_net_cr_amt} END ;;
#     value_format_name: usd_0
#   }

  measure: fcst_net_dr_amt {
    label: "Forecast Debit$"
    group_label: "Forecast"
    description: "Forecast Debit $"
    type: sum
    sql: ${TABLE}.fcst_net_dr_amt ;;
    value_format_name: usd_0
  }

  measure: fcst_net_cr_amt {
    label: "Forecast Credit$"
    group_label: "Forecast"
    description: "Forecast Credit $"
    type: sum
    sql: ${TABLE}.fcst_net_cr_amt ;;
    value_format_name: usd_0
  }

#   measure: fcst_net_amt {
#     label: "Forecast Balance$"
#     group_label: "Forecast"
#     description: "Forecast Balance $"
#     type: number
#     drill_fields: [  ]
#     sql: CASE WHEN ${TABLE}.s2_type_name = 'Revenue' THEN ${fcst_net_cr_amt}-${fcst_net_dr_amt} ELSE ${fcst_net_dr_amt}-${fcst_net_cr_amt} END ;;
#     value_format_name: usd_0
#   }

  measure: prjc_net_dr_amt {
    label: "Projected Debit$"
    group_label: "Projected"
    description: "Projected Debit $"
    type: sum
    sql: ${TABLE}.prjc_net_dr_amt ;;
    value_format_name: usd_0
  }

  measure: prjc_net_cr_amt {
    label: "Projected Credit$"
    group_label: "Projected"
    description: "Projected Credit $"
    type: sum
    sql: ${TABLE}.prjc_net_cr_amt ;;
    value_format_name: usd_0
  }

#   measure: prjc_net_amt {
#     label: "Projected Balance$"
#     group_label: "Projected"
#     description: "Projected Balance $"
#     type: number
#     sql: CASE WHEN ${TABLE}.s2_type_name = 'Revenue' THEN ${prjc_net_cr_amt}-${prjc_net_dr_amt} ELSE ${prjc_net_dr_amt}-${prjc_net_cr_amt} END ;;
#     value_format_name: usd_0
#   }


}
