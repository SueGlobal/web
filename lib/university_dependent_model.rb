# -*- encoding : utf-8 -*-
module UniversityDependentModel

  def self.included(base)
    base.belongs_to :university
    base.send :include, FriendlyId
    base.friendly_id :name_for_slug, use: :slugged
    base.validates_presence_of :slug
  end

  # When to generate slug
  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def name_for_slug
    "#{university.abbreviation} #{column_for_slug}".delete "."
  end
end
