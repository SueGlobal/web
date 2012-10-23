# -*- encoding : utf-8 -*-
module Study
  def self.included(base)
    base.belongs_to :university
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
