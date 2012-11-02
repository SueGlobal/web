# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student_study do
    basic_question
    class_year_question
    field_work_question
    funding_question
    sample_question
    software_question
    study_periodicity_question
    information_question
    sequence(:slug) { |n| "slug-#{n}" }
    scope "MyText"
    participates_employment_agency false
    participates_quality_area false
    participates_university_department false
    participates_foundation false
    participates_aneca false
    participates_state_organization false
    participates_chamber_of_commerce false
    participates_state_employment_agency false
    participates_employers_association false
    participates_companies false
    participates_european_institutions false
    participates_labor_unions false
    participates_professional_associations false
    participates_others_check false
    participates_others "Others"
    reference_period "MyText"
    variable_graduate_profile false
    variable_complementary_activities false
    variable_satisfaction false
    variable_job_hunting false
    variable_study_job_compatibility false
    variable_first_job false
    variable_employees false
    variable_self_employees false
    variable_contract_type false
    variable_current_job false
    variable_employee_situation false
    variable_knowledge_valuation false
    variable_competence_valuation false
    variable_other "MyText"
    notes "MyText"
    university
  end
end
