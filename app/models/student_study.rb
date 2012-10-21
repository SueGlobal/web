# -*- encoding : utf-8 -*-
class StudentStudy < ActiveRecord::Base
  include ContainsSoftwareQuestions
  include ContainsBasicQuestions
  include ContainsSampleQuestions
  include ContainsFundingQuestions
  include Study

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
    :variable_other
  ]

  attr_accessible *PARTICIPATES[:intern]
  attr_accessible *PARTICIPATES[:extern]
  attr_accessible *PARTICIPATES[:other]
  attr_accessible *VARIABLES
  attr_accessible :notes, :questionnaire_link, :reference_period, :scope
end
