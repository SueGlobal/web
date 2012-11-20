# -*- encoding : utf-8 -*-
class CreateSegmentationVariableValues < ActiveRecord::Migration
  def change
    create_table :segmentation_variable_values do |t|
      t.string :value
      t.references :segmentation_variable
      t.integer :order

      t.timestamps
    end
    add_index :segmentation_variable_values, :segmentation_variable_id
  end
end
