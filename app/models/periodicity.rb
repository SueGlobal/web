# -*- encoding : utf-8 -*-
class Periodicity < ActiveRecord::Base
  belongs_to :periodic, polymorphic: true
  attr_accessible :other_description, :periodicity_type

  class << self
    def select_options
      [:anual, :six_monthly, :four_monthly, :no_periodicity, :other].map do |opt|
        [I18n.t(opt, scope: 'activerecord.attributes.periodicity.select_attributes'), opt.to_s]
      end
    end
  end
end
