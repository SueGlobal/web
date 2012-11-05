# -*- encoding : utf-8 -*-
class AgreementSourceStudy < ActiveRecord::Base

  include Study
  include_questions :basic_question, :source_question,
    :class_year_question, :software_question,
    :funding_question, :information_question

  VARIABLES_PES = [
    :variable_pes_insertion,
    :variable_pes_contract_type,
    :variable_pes_cno,
    :variable_pes_municipality,
    :variable_pes_init_contract_date,
    :variable_pes_end_contract_date,
    :variable_pes_number_of_workers,
    :variable_pes_number_of_workers_last_contract,
    :variable_pes_cnae,
    :variable_pes_cnae_2009
  ]

  VARIABLES_PES_OTHER = [
    :variable_pes_other
  ]

  VARIABLES_JD = [
    :variable_jd_unemployment,
    :variable_jd_demand_ocupation,
    :variable_jd_unemployment_duration,
    :variable_jd_long_time_unemployed,
    :variable_jd_demand_activity,
    :variable_jd_demand_activity_2009,
    :variable_jd_unemployment_benefit,
    :variable_jd_index
  ]

  VARIABLES_JD_OTHER = [
    :variable_jd_other
  ]

  VARIABLES_SS = [
    :variable_ss_working_life,
    :variable_ss_crossing_date,
    :variable_ss_user_id,
    :variable_ss_ss_number,
    :variable_ss_birth_date,
    :variable_ss_cif,
    :variable_ss_contribution_type,
    :variable_ss_firm_name,
    :variable_ss_registration_date,
    :variable_ss_discharge_date,
    :variable_ss_total_days,
    :variable_ss_ctp,
    :variable_ss_special_regime_type,
  ]

  VARIABLES_SS_OTHER = [
    :variable_ss_other,
  ]

  VARIABLES_OTHER = [
    :variable_other
  ]

  attr_accessible :slug, :notes

  attr_accessible *VARIABLES_PES
  attr_accessible *VARIABLES_PES_OTHER
  attr_accessible *(VARIABLES_PES_OTHER.map{|x| :"#{x}_check"})
  attr_accessible *VARIABLES_JD
  attr_accessible *VARIABLES_JD_OTHER
  attr_accessible *(VARIABLES_JD_OTHER.map{|x| :"#{x}_check"})
  attr_accessible *VARIABLES_SS
  attr_accessible *VARIABLES_SS_OTHER
  attr_accessible *(VARIABLES_SS_OTHER.map{|x| :"#{x}_check"})
  attr_accessible *VARIABLES_OTHER
  attr_accessible *(VARIABLES_OTHER.map{|x| :"#{x}_check"})

  def column_for_slug
    basic_question.title
  end
end
