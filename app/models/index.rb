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
    order: 'name ASC',
    conditions: {confirmed: true}
  has_many :index_confirmations

  accepts_nested_attributes_for :periodicity

  attr_accessible :description, :methodology_url,
    :name, :informative, :periodicity_attributes, :source_id,
    :segment_ids, :parent_id


  validates_presence_of :name, :description

  validates_presence_of :methodology_url, unless: :root?

  before_save :set_root
  before_create :set_confirmation
  after_create :send_confirmation

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

  def set_confirmation
    self.confirmed = false
    true
  end

  def send_confirmation
    User.admin.each do |u|
      u.confirm_index self
    end
  end

  def check_all_accepted
    if self.index_confirmations.all?(&:accepted?)
      self.confirmed = true
      self.save
      User.admin.each do |u|
        IndexConfirmationMailer.confirmation_passed(u, self).deliver
      end
    end
  end

  def reject
    User.admin.each do |u|
      IndexConfirmationMailer.confirmation_failed(u, self).deliver
    end
    self.destroy
  end

  class << self

    def root
      confirmed.where(root: true).order('name ASC')
    end

    def confirmed
      where(confirmed: true)
    end
  end
end
