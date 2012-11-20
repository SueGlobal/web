# -*- encoding : utf-8 -*-
class SegmentationVariable < ActiveRecord::Base
  attr_accessible :name

  validates :name,
    presence: true

  has_many :segmentation_variable_values,
    order: 'order ASC'

  include FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def to_key
    [slug]
  end
end
