# -*- encoding : utf-8 -*-
class ClassYearQuestion < ActiveRecord::Base
  attr_accessible :time_from_graduation_other, :time_from_graduation_type
  attr_accessible :class_years_attributes

  belongs_to :studiable, polymorphic: true

  has_many :class_years
  accepts_nested_attributes_for :class_years, allow_destroy: true

  class << self

    def select_options
      [:one_year, :three_years, :five_years, :other].map do |opt|
        [translate_option(opt), opt.to_s]
      end
    end

    def translate_option opt
      I18n.t(opt, scope: 'activerecord.attributes.class_year_question.select_options')
    end
  end
end
