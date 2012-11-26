# -*- encoding : utf-8 -*-
class SegmentationVariable < ActiveRecord::Base
  attr_accessible :name, :segmentation_variable_values_attributes

  validates :name,
    presence: true

  has_many :segmentation_variable_values,
    order: '"order" ASC'

  has_many :segments,
    order: '"name" ASC'

  after_create :create_total_segment

  accepts_nested_attributes_for :segmentation_variable_values

  default_scope do
    order('name ASC').includes(:segments)
  end
  def clean_update_attributes attrs
    update_attributes clean_attributes(attrs)
  end

  def clean_attributes attrs
    variable_values = attrs["segmentation_variable_values_attributes"]
    if variable_values
      new_values = segmentation_variable_values.inject({}) do |memo, obj|
        memo.tap do |m|
          memo[obj.id.to_s] = variable_values[obj.id.to_s] if variable_values.has_key? obj.id.to_s
        end
      end
      attrs["segmentation_variable_values_attributes"] = new_values
    end
    attrs
  end

  include FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def to_key
    [slug]
  end

  def create_total_segment
    segments.build.tap do |s|
      s.name = 'Total'
      s.segmentation_variable_values = segmentation_variable_values
      s.save
    end
  end
  class << self

    def for_check_boxes
      self.all.map do |var|
        [var.id, "#{var.name} (#{var.segmentation_variable_values.count})"]
      end
    end
  end
end
