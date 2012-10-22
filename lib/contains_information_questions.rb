# -*- encoding : utf-8 -*-
module ContainsInformationQuestions
  def self.included(base)
    base.has_one :information_question, as: :studiable
    base.attr_accessible :information_question_attributes
    base.accepts_nested_attributes_for :information_question
  end
end
