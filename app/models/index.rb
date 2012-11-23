# -*- encoding : utf-8 -*-
class Index < ActiveRecord::Base
  belongs_to :source
  belongs_to :periodicity
  has_many :index_segmentation_variables
  has_many :segmentation_variables,
    through: :index_segmentation_variables
  attr_accessible :description, :methodology_url,
    :name, :informative, :periodicity_id, :source_id,
    :segmentation_variable_ids

  validates_presence_of :name, :description, :methodology_url

  include FriendlyId
  friendly_id :name_for_slug, use: :slugged
  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def name_for_slug
    name
  end

  def to_key
    [slug]
  end
end
