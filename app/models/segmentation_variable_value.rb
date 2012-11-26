# -*- encoding : utf-8 -*-
class SegmentationVariableValue < ActiveRecord::Base
  belongs_to :segmentation_variable,
    counter_cache: true

  has_and_belongs_to_many :segments
  attr_accessible :value, :order

  validates :value,
    presence: true

  validates :order,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
