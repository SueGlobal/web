# -*- encoding : utf-8 -*-
class CreateAchievedActivities < ActiveRecord::Migration
  def change
    create_table :achieved_activities do |t|
      t.boolean :studies_on_students
      t.boolean :external_practices
      t.boolean :internal_practices
      t.boolean :labor_orientation
      t.boolean :employment_agency
      t.boolean :external_colaborations
      t.boolean :research_projects
      t.boolean :international_dimension
      t.text :other_activities
      t.boolean :includes_studies_on_students
      t.boolean :includes_studies_on_employers
      t.boolean :includes_public_secondary_sources
      t.boolean :includes_non_public_secondary_sources
      t.string :includes_university_databases
      t.boolean :includes_other_studies
      t.references :university

      t.timestamps
    end
  end
end
