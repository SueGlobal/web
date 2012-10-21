# -*- encoding : utf-8 -*-
module ContainsFieldWorkQuestions
  def self.included(base)
    base.has_one :field_work_question, as: :studiable
    base.attr_accessible :field_work_question_attributes
    base.accepts_nested_attributes_for :field_work_question
  end
end
