# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base

  default_scope do
    order('name ASC')
  end
  class << self

    def has_many_studies *names
      names.each do |study|
        has_many :"#{study}_studies",
          include: :basic_question,
          order: 'basic_questions.year DESC, basic_questions.title ASC'
      end
    end
  end

  attr_accessor :admin_emails
  attr_accessible :admin_emails

  attr_accessible :abbreviation, :name, :community_id
  belongs_to :community
  has_many :users
  has_many :services,
           order: 'name ASC'
  has_many :general_frames,
           order: 'year DESC'
  has_many :achieved_activities,
           order: 'year DESC'

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
end
