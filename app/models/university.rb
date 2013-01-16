# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base

  REJECT_WORDS = ["universidad", "universitat", "Universidad", "Universitat", "de", "la", "el", "las", "los"]
  default_scope do
    order('name_for_order ASC')
  end
  class << self

    def has_many_studies *names
      names.each do |study|
        has_many :"#{study}_studies",
          include: :basic_question,
          order: 'basic_questions.year DESC, basic_questions.title ASC',
          dependent: :destroy

        define_method "first_#{study}" do
          send("#{study}_studies").limit(APP_CONFIG[:university_resource_limit])
        end
      end
    end
  end

  attr_accessor :admin_emails
  attr_accessible :admin_emails

  attr_accessible :abbreviation, :name, :community_id
  belongs_to :community
  has_many :users
  has_many :services,
           order: 'name ASC',
           dependent: :destroy
  has_many :general_frames,
           order: 'year DESC',
           dependent: :destroy

  def first_general_frames
    general_frames.limit(5)
  end

  has_many :achieved_activities,
           order: 'year DESC',
           dependent: :destroy

  def first_achieved_activities
    achieved_activities.limit(APP_CONFIG[:university_resource_limit])
  end


  before_save :set_name_for_order

  has_many_studies :student, :employer, :public_source,
    :agreement_source, :database, :other

  validates :name,
    presence: true,
    uniqueness: true

  validates :abbreviation,
    presence: true,
    uniqueness: true

  validates :slug,
    presence: true

  include FriendlyId
  friendly_id :name_for_slug, use: :slugged
  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def name_for_slug
    (abbreviation || "").delete "."
  end

  def to_key
    [slug]
  end

  protected
  def set_name_for_order
    if changed_attributes.key?("name") || self.name_for_order.blank?
      self.name_for_order = self.name.split(" ").reject{|x| REJECT_WORDS.include? x }.join(' ')
    end
  end
end
