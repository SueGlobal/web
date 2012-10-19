# -*- encoding : utf-8 -*-
module ContainsSoftwareQuestions
  def self.included(base)
    base.has_one :software_question, as: :studiable
    base.attr_accessible :software_question_attributes
    base.accepts_nested_attributes_for :software_question
  end
end
