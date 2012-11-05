# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :agreement_source_study do
    basic_question
    source_question
    class_year_question
    software_question
    funding_question
    information_question
    variable_pes_insertion false
    variable_pes_contract_type false
    variable_pes_cno false
    variable_pes_municipality false
    variable_pes_init_contract_date false
    variable_pes_end_contract_date false
    variable_pes_number_of_workers false
    variable_pes_number_of_workers_last_contract false
    variable_pes_cnae false
    variable_pes_cnae_2009 false
    variable_pes_other_check false
    variable_pes_other "MyText"
    variable_jd_unemployment false
    variable_jd_demand_ocupation false
    variable_jd_unemployment_duration ""
    variable_jd_long_time_unemployed false
    variable_jd_demand_activity false
    variable_jd_demand_activity_2009 false
    variable_jd_unemployment_benefit false
    variable_jd_index false
    variable_jd_other_check false
    variable_jd_other "MyText"
    variable_ss_working_life false
    variable_ss_crossing_date false
    variable_ss_user_id false
    variable_ss_ss_number false
    variable_ss_birth_date false
    variable_ss_cif false
    variable_ss_contribution_type false
    variable_ss_firm_name false
    variable_ss_registration_date false
    variable_ss_discharge_date false
    variable_ss_total_days false
    variable_ss_ctp false
    variable_ss_special_regime_type false
    variable_ss_other_check false
    variable_ss_other "MyText"
    variable_other_check false
    variable_other "MyText"
    university
    notes "Notes"
    agreement_transience "Anual"
    agreement_signers "Some people"
    slug "MyText"
  end
end
