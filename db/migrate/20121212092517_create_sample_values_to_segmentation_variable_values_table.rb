# -*- encoding : utf-8 -*-
class CreateSampleValuesToSegmentationVariableValuesTable < ActiveRecord::Migration
  def change
    create_table :sample_values_segmentation_variable_values, id: false do |t|
      t.references :sample_values
      t.references :segmentation_variable_values
    end
    add_index :sample_values_segmentation_variable_values, :sample_values_id, name: 'index_for_sample_values_to_segmentation_variable_values'
  end
end
