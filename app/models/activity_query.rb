# -*- encoding : utf-8 -*-
class ActivityQuery
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  extend ActiveModel::Translation
  include ActiveModel::Validations

  BOOLEAN_ATTRIBUTES = [
     :studies_on_students,
     :external_practices,
     :internal_practices,
     :labor_orientation,
     :employment_agency,
     :external_colaborations,
     :research_projects,
     :entrepreneur_advising,
     :formation_for_employement,
     :international_dimension,
     :includes_studies_on_students,
     :includes_studies_on_employers,
     :includes_public_secondary_sources,
     :includes_non_public_secondary_sources,
     :includes_university_databases,
     :includes_other_studies
  ]
  BOOLEAN_ATTRIBUTES.each do |bool_attr|
    attribute bool_attr, Boolean
  end
  attribute  :year, Integer


  def activities
    boolean_restrictions.where(year: self.year).order('university_id ASC')
  end

  def universities
    University.where(id: activities.select(:university_id).uniq.pluck(:university_id))
  end

  def persisted?
    false
  end

  def boolean_restrictions
    BOOLEAN_ATTRIBUTES.inject(AchievedActivity) do |memo, obj|
      if self.send(obj)
        memo.where(obj => true)
      else
        memo
      end
    end
  end
end
