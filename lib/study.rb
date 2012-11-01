# -*- encoding : utf-8 -*-
module Study
  def self.included(base)
    base.send :include, ::UniversityDependentModel
    base.extend ClassMethods
  end

  module ClassMethods

    def questions
      @questions
    end

    def include_questions *questions
      questions.each do |q|
        has_one q, as: :studiable
        attr_accessible :"#{q}_attributes"
        accepts_nested_attributes_for q
        add_question q
      end
    end

    def add_question q
      (@questions ||= []) << q
    end
  end
end
