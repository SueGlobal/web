# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base
  attr_accessor :admin_emails
  attr_accessible :admin_emails

  attr_accessible :abbreviation, :name, :province_id
  belongs_to :province
  has_many :users
  has_many :services
  has_many :general_frames
  has_many :achieved_activities
  has_many :student_studies

  validates :name,
    presence: true,
    uniqueness: true

  validates :abbreviation,
    presence: true,
    uniqueness: true
end
