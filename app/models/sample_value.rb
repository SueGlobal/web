# -*- encoding : utf-8 -*-
class SampleValue < ActiveRecord::Base
  belongs_to :sample
  attr_accessible :value

  def value=(value)
    self.value_in_cents = (value * 100).to_i
  end

  def value
    self.value_in_cents/100.0
  end
end
