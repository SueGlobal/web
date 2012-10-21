# -*- encoding : utf-8 -*-
class SampleQuestion < ActiveRecord::Base
  SAMPLING_OPTIONS = [:non_probabilistic, :probabilistic, :total_population, :undefined]

  attr_accessible :disintegration_level, :non_probabilistic_description, :population, :sampling_option, :sampling_type, :scope

  belongs_to :studiable, polymorphic: true
end
