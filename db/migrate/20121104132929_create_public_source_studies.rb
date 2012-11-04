# -*- encoding : utf-8 -*-
class CreatePublicSourceStudies < ActiveRecord::Migration
  def change
    create_table :public_source_studies do |t|
      t.references :university
      t.text :slug
      t.text :variables
      t.text :notes

      t.timestamps
    end
    add_index :public_source_studies, :slug, unique: true
    add_index :public_source_studies, :university_id
  end
end
