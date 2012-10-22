# -*- encoding : utf-8 -*-
module ContainsStudyPeriodicityQuestions
  def self.included(base)
    base.has_one :study_periodicity_question, as: :studiable
    base.attr_accessible :study_periodicity_question_attributes
    base.accepts_nested_attributes_for :study_periodicity_question
  end
end
