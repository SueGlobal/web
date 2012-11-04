# -*- encoding : utf-8 -*-
class CreateDatabaseStudies < ActiveRecord::Migration
  def change
    create_table :database_studies do |t|
      t.references :university
      t.text :description
      t.text :database
      t.text :variables
      t.text :producer
      t.text :analyzer
      t.text :notes
      t.text :slug

      t.timestamps
    end
    add_index :database_studies, :university_id
    add_index :database_studies, :slug, unique: true
  end
end
