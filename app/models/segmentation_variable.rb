# -*- encoding : utf-8 -*-
class SegmentationVariable < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    presence: true

  has_many :segmentation_variable_values,
    order: 'order ASC'
end
