# -*- encoding : utf-8 -*-
class Periodicity < ActiveRecord::Base
  belongs_to :periodic, polymorphic: true
  attr_accessible :other_description, :periodicity_type

  TYPES = [:anual, :six_monthly, :four_monthly, :no_periodicity, :other]

  TYPES.each do |t|
    define_method :"#{t}?" do
      self.periodicity_type.to_sym == t
    end
  end

  class << self

    def select_options
      TYPES.map do |opt|
        [translate_option(opt), opt.to_s]
      end
    end

    def translate_option opt
      I18n.t(opt, scope: 'activerecord.attributes.periodicity.select_attributes')
    end
  end
end
