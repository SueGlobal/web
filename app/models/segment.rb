# -*- encoding : utf-8 -*-
class Segment < ActiveRecord::Base
  belongs_to :segmentation_variable
  attr_accessible :name, :segmentation_variable_values_ids
  has_and_belongs_to_many :segmentation_variable_values

  validates :name,
    presence: true
end
