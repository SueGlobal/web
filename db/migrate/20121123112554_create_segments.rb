# -*- encoding : utf-8 -*-
class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.string :slug
      t.references :segmentation_variable

      t.timestamps
    end
    add_index :segments, :slug
    add_index :segments, :segmentation_variable_id
  end
end
