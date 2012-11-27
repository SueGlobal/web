# -*- encoding : utf-8 -*-
class Segment < ActiveRecord::Base
  belongs_to :segmentation_variable
  attr_accessible :name, :segmentation_variable_value_ids
  has_and_belongs_to_many :segmentation_variable_values

  validates :name,
    presence: true

  def to_label
    "#{name} (#{segmentation_variable.name})"
  end
end
