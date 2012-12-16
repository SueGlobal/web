# -*- encoding : utf-8 -*-
class Periodicity < ActiveRecord::Base
  belongs_to :periodic, polymorphic: true
  attr_accessible :other_description, :periodicity_type

  TYPES = [:three_years, :two_years, :anual, :six_monthly, :four_monthly, :three_monthly, :monthly, :no_periodicity, :other]

  TIME_FOR_TYPE = {
    three_years: 3.years,
    two_years: 2.years,
    anual: 1.year,
    six_monthly: 6.months,
    four_monthly: 4.months,
    three_monthly: 3.months,
    monthly: 1.month,
    no_periodicity: 0.seconds,
    other: 0.seconds
  }
  TYPES.each do |t|
    define_method :"#{t}?" do
      self.periodicity_type.to_sym == t
    end
  end

  def periodicity_type
    self[:periodicity_type] || "anual"
  end

  def as_time
    TIME_FOR_TYPE[periodicity_type.to_sym] || 0.seconds
  end

  class << self

    def select_options
      TYPES.map do |opt|
        [translate_option(opt), opt.to_s]
      end
    end

    def select_options_without_other
      TYPES[0...-1].map do |opt|
        [translate_option(opt), opt.to_s]
      end
    end

    def translate_option opt
      I18n.t(opt, scope: 'activerecord.attributes.periodicity.select_attributes')
    end
  end
end
