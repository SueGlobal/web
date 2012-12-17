# -*- encoding : utf-8 -*-
class EmployerStudy < ActiveRecord::Base
  include Study
  include_questions :basic_question, :sample_question,
    :funding_question, :field_work_question,
    :study_periodicity_question, :information_question,
    :software_question

  VARIABLES = [
    :variable_selection_process,
    :variable_extra_experience,
    :variable_offer_requirements,
    :variable_contract_characteristics,
    :variable_knowledge_evaluation,
    :variable_competence_evaluation
  ]

  VARIABLES_OTHER = [
    :variable_other
  ]

  SEGMENTATION_VARIABLES = [
     :segmentation_variable_activity_sector,
     :segmentation_variable_organization_size,
     :segmentation_variable_companies_using_ues,
     :segmentation_variable_companies_hiring_graduates,
     :segmentation_variable_no_segmentation
  ]

  SEGMENTATION_VARIABLES_OTHER = [
    :segmentation_variable_others
  ]

  attr_accessible *VARIABLES
  attr_accessible *VARIABLES_OTHER
  attr_accessible *(VARIABLES_OTHER.map{|x| :"#{x}_check"})

  attr_accessible *SEGMENTATION_VARIABLES
  attr_accessible *SEGMENTATION_VARIABLES_OTHER
  attr_accessible *(SEGMENTATION_VARIABLES_OTHER.map{|x| :"#{x}_check"})

  attr_accessible :notes

  def column_for_slug
    basic_question.title
  end

  scope :year, ->(year) { includes(:basic_question).where('basic_questions.year = ?', [year]) }
end
