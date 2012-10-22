# -*- encoding : utf-8 -*-
module ContainsClassYearQuestions
  def self.included(base)
    base.has_one :class_year_question, as: :studiable
    base.attr_accessible :class_year_question_attributes
    base.accepts_nested_attributes_for :class_year_question
  end
end
