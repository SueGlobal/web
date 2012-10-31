# -*- encoding : utf-8 -*-
module Study
  def self.included(base)
    base.send :include, ::UniversityDependentModel
    base.extend ClassMethods
  end

  module ClassMethods

    def include_questions *questions
      questions.each do |q|
        has_one q, as: :studiable
        attr_accessible :"#{q}_attributes"
        accepts_nested_attributes_for q
      end
    end
  end
end
