# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employer_study do
    university
    basic_question
    sample_question
    funding_question
    field_work_question
    study_periodicity_question
    information_question
    software_question
    variable_selection_process false
    variable_extra_experience false
    variable_offer_requirements false
    variable_contract_characteristics false
    variable_knowledge_evaluation false
    variable_competence_evaluation false
    variable_other_check false
    variable_other "MyText"
    segmentation_variable_activity_sector false
    segmentation_variable_organization_size false
    segmentation_variable_companies_using_ues false
    segmentation_variable_companies_hiring_graduates false
    segmentation_variable_others_check false
    segmentation_variable_others "MyText"
    segmentation_variable_no_segmentation false
    notes "MyText"
  end
end
