# -*- encoding : utf-8 -*-
class SegmentationVariable < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    presence: true
end
