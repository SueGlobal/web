# -*- encoding : utf-8 -*-
class StudentStudy < ActiveRecord::Base
  include Study
  include_questions :basic_question, :sample_question,
                    :funding_question, :field_work_question,
                    :study_periodicity_question,
                    :class_year_question, :information_question,
                    :software_question

  PARTICIPATES = {
    intern: [
              :participates_employment_agency,
              :participates_quality_area,
              :participates_university_department,
              :participates_foundation
            ],
    extern: [
              :participates_aneca,
              :participates_state_organization,
              :participates_other_universities,
              :participates_chamber_of_commerce,
              :participates_state_employment_agency,
              :participates_employers_association,
              :participates_companies,
              :participates_european_institutions,
              :participates_labor_unions,
              :participates_professional_associations
            ],
    other: [:participates_others]
  }

  VARIABLES = [
    :variable_graduate_profile,
    :variable_complementary_activities,
    :variable_satisfaction,
    :variable_job_hunting,
    :variable_study_job_compatibility,
    :variable_first_job,
    :variable_employees,
    :variable_self_employees,
    :variable_contract_type,
    :variable_current_job,
    :variable_employee_situation,
    :variable_knowledge_valuation,
    :variable_competence_valuation,
  ]

  VARIABLES_OTHER = [
    :variable_other
  ]

  attr_accessible *PARTICIPATES[:intern]
  attr_accessible *PARTICIPATES[:extern]
  attr_accessible *PARTICIPATES[:other]
  attr_accessible *(PARTICIPATES[:other].map{|x| "#{x}_check"})
  attr_accessible *VARIABLES
  attr_accessible *VARIABLES_OTHER
  attr_accessible *(VARIABLES_OTHER.map{|x| "#{x}_check"})
  attr_accessible :notes, :reference_period, :scope

  def column_for_slug
    basic_question.title
  end
end
