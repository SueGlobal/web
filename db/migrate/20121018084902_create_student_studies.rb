# -*- encoding : utf-8 -*-
class CreateStudentStudies < ActiveRecord::Migration
  def change
    create_table :student_studies do |t|
      t.text :title
      t.text :author
      t.text :scope
      t.text :population
      t.boolean :participates_employment_agency
      t.boolean :participates_quality_area
      t.boolean :participates_university_department
      t.boolean :participates_foundation
      t.boolean :participates_aneca
      t.boolean :participates_state_organization
      t.boolean :participates_chamber_of_commerce
      t.boolean :participates_state_employment_agency
      t.boolean :participates_employers_association
      t.boolean :participates_companies
      t.boolean :participates_european_institutions
      t.boolean :participates_labor_unions
      t.boolean :participates_professional_associations
      t.boolean :participates_others
      t.text :reference_period
      t.boolean :variable_graduate_profile
      t.boolean :variable_complementary_activities
      t.boolean :variable_satisfaction
      t.boolean :variable_job_hunting
      t.boolean :variable_study_job_compatibility
      t.boolean :variable_first_job
      t.boolean :variable_employees
      t.boolean :variable_self_employees
      t.boolean :variable_contract_type
      t.boolean :variable_current_job
      t.boolean :variable_employee_situation
      t.boolean :variable_knowledge_valuation
      t.boolean :variable_competence_valuation
      t.text :variable_other
      t.text :questionnaire_link
      t.text :notes

      t.timestamps
    end
  end
end
