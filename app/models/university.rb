# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base

  default_scope do
    order('name ASC')
  end

  attr_accessor :admin_emails
  attr_accessible :admin_emails

  attr_accessible :abbreviation, :name, :community_id
  belongs_to :community
  has_many :users
  has_many :services
  has_many :general_frames,
           order: 'year DESC'
  has_many :achieved_activities,
           order: 'year DESC'

  has_many :student_studies,
    include: :basic_question,
    order: 'basic_questions.year DESC'

  has_many :employer_studies,
    include: :basic_question,
    order: 'basic_questions.year DESC'

  has_many :public_source_studies,
    include: :basic_question,
    order: 'basic_questions.year desc'

  has_many :agreement_source_studies,
    include: :basic_question,
    order: 'basic_questions.year desc'

  has_many :database_studies,
    include: :basic_question,
    order: 'basic_questions.year desc'

  has_many :other_studies,
    include: :basic_question,
    order: 'basic_questions.year DESC'

  validates :name,
    presence: true,
    uniqueness: true

  validates :abbreviation,
    presence: true,
    uniqueness: true

  validates :slug,
    presence: true

  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  include FriendlyId
  friendly_id :name_for_slug, use: :slugged
  def name_for_slug
    (abbreviation || "").delete "."
  end
end
