# -*- encoding : utf-8 -*-
class CreateOtherStudies < ActiveRecord::Migration
  def change
    create_table :other_studies do |t|
      t.text :description
      t.text :notes
      t.references :university

      t.timestamps
    end
    add_index :other_studies, :university_id
  end
end
