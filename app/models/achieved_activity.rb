# -*- encoding : utf-8 -*-
class AchievedActivity < ActiveRecord::Base
  ACTIVITIES = [
    :studies_on_students,
    :external_practices,
    :internal_practices,
    :labor_orientation,
    :employment_agency,
    :external_colaborations,
    :research_projects,
    :international_dimension,
    :other_activities
  ]
  SOURCES= [
    :includes_studies_on_students,
    :includes_studies_on_employers,
    :includes_public_secondary_sources,
    :includes_non_public_secondary_sources,
    :includes_university_databases,
    :includes_other_studies
  ]
  attr_accessible *ACTIVITIES
  attr_accessible *SOURCES
  attr_accessible :year
  belongs_to :university

  validates :year,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  before_validation do
    self.year = self.year.to_i
  end
end
