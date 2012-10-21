# -*- encoding : utf-8 -*-
module ContainsSampleQuestions
  def self.included(base)
    base.has_one :sample_question, as: :studiable
    base.attr_accessible :sample_question_attributes
    base.accepts_nested_attributes_for :sample_question
  end
end
