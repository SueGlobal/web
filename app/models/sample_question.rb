# -*- encoding : utf-8 -*-
class SampleQuestion < ActiveRecord::Base
  SAMPLING_OPTIONS = [:non_probabilistic, :probabilistic, :total_population, :undefined]

  attr_accessible :disintegration_level, :non_probabilistic_description, :population, :sampling_option, :sampling_type, :scope

  belongs_to :studiable, polymorphic: true

  SAMPLING_OPTIONS.each do |opt|
    define_method :"#{opt}?" do
      self.sampling_type.to_sym == opt
    end
  end

  class << self
    def translate_option opt
      I18n.t(opt, scope: 'activerecord.attributes.sample_question.sampling_options')
    end
  end
end
