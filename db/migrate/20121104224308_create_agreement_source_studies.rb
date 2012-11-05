# -*- encoding : utf-8 -*-
class CreateAgreementSourceStudies < ActiveRecord::Migration
  def change
    create_table :agreement_source_studies do |t|
      t.boolean :variable_pes_insertion
      t.boolean :variable_pes_contract_type
      t.boolean :variable_pes_cno
      t.boolean :variable_pes_municipality
      t.boolean :variable_pes_init_contract_date
      t.boolean :variable_pes_end_contract_date
      t.boolean :variable_pes_number_of_workers
      t.boolean :variable_pes_number_of_workers_last_contract
      t.boolean :variable_pes_cnae
      t.boolean :variable_pes_cnae_2009
      t.boolean :variable_pes_other_check
      t.text :variable_pes_other
      t.boolean :variable_jd_unemployment
      t.boolean :variable_jd_demand_ocupation
      t.boolean :variable_jd_unemployment_duration
      t.boolean :variable_jd_long_time_unemployed
      t.boolean :variable_jd_demand_activity
      t.boolean :variable_jd_demand_activity_2009
      t.boolean :variable_jd_unemployment_benefit
      t.boolean :variable_jd_index
      t.boolean :variable_jd_other_check
      t.text :variable_js_other
      t.boolean :variable_ss_working_life
      t.boolean :variable_ss_crossing_date
      t.boolean :variable_ss_user_id
      t.boolean :variable_ss_ss_number
      t.boolean :variable_ss_birth_date
      t.boolean :variable_ss_cif
      t.boolean :variable_ss_contribution_type
      t.boolean :variable_ss_firm_name
      t.boolean :variable_ss_registration_date
      t.boolean :variable_ss_discharge_date
      t.boolean :variable_ss_total_days
      t.boolean :variable_ss_ctp
      t.boolean :variable_ss_special_regime_type
      t.boolean :variable_ss_other_check
      t.text :variable_ss_other
      t.boolean :variable_other_check
      t.text :variable_other
      t.references :university
      t.text :notes
      t.text :slug

      t.timestamps
    end
    add_index :agreement_source_studies, :university_id
    add_index :agreement_source_studies, :slug, unique: true
  end
end
