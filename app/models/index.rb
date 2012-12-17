# -*- encoding : utf-8 -*-
class Index < ActiveRecord::Base
  belongs_to :source
  belongs_to :periodicity
  belongs_to :parent, class_name: 'Index'

  has_many :index_segments
  has_many :segments,
    through: :index_segments
  has_many :segmentation_variables,
    through: :segments
  has_many :samples,
    order: 'taken_at DESC'
  has_many :children, class_name: 'Index',
    foreign_key: 'parent_id',
    order: 'name ASC'

  accepts_nested_attributes_for :periodicity

  attr_accessible :description, :methodology_url,
    :name, :informative, :periodicity_attributes, :source_id,
    :segment_ids, :parent_id


  validates_presence_of :name, :description

  validates_presence_of :methodology_url, unless: :root?

  before_save :set_root

  def periodicity
    super || (self.periodicity = Periodicity.new)
  end

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

  def set_root
    self.root = self.parent.nil?
    true
  end

  class << self

    def root
      where(root: true).order('name ASC')
    end
  end
end
