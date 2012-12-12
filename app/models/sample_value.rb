# -*- encoding : utf-8 -*-
class SampleValue < ActiveRecord::Base
  belongs_to :sample
  has_and_belongs_to_many :segmentation_variable_values
  attr_accessible :value, :segmentation_variable_values_ids

  default_scope do
    includes(:segmentation_variable_values)
  end

  def value=(value)
    self.value_in_cents = (value * 100).to_i
  end

  def value
    self.value_in_cents/100.0
  end
end
