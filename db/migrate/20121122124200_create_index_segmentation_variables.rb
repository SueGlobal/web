# -*- encoding : utf-8 -*-
class CreateIndexSegmentationVariables < ActiveRecord::Migration
  def change
    create_table :index_segmentation_variables do |t|
      t.boolean :primary
      t.references :index
      t.references :segmentation_variable

      t.timestamps
    end
    add_index :index_segmentation_variables, :index_id
    add_index :index_segmentation_variables, :segmentation_variable_id
  end
end
