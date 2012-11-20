# -*- encoding : utf-8 -*-
class CreateSegmentationVariables < ActiveRecord::Migration
  def change
    create_table :segmentation_variables do |t|
      t.string :slug
      t.text :name

      t.timestamps
    end
  end
end
