# -*- encoding : utf-8 -*-
module ContainsBasicQuestions
  def self.included(base)
    base.has_one :basic_question, as: :studiable
    base.attr_accessible :basic_question_attributes
    base.accepts_nested_attributes_for :basic_question
  end
end
