# -*- encoding : utf-8 -*-
class Service < ActiveRecord::Base
  include UniversityDependentModel
  attr_accessible :dependency, :name

  validates :name,
    presence: true

  validates :dependency,
    presence: true

  def column_for_slug
    name
  end

  # For UniversitiesSummary support.
  scope :year, ->(year) { }
end
