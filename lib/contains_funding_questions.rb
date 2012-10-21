# -*- encoding : utf-8 -*-
module ContainsFundingQuestions
  def self.included(base)
    base.has_one :funding_question, as: :studiable
    base.attr_accessible :funding_question_attributes
    base.accepts_nested_attributes_for :funding_question
  end
end
