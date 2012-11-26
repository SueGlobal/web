# -*- encoding : utf-8 -*-
class CreateSegmentationVariableValuesSegments < ActiveRecord::Migration
  def change
    create_table :segmentation_variable_values_segments do |t|
      t.references :segment
      t.references :segmentation_variable_value
    end

    add_index :segmentation_variable_values_segments, :segment_id, name: 'segments_to_values_segment_id'
    add_index :segmentation_variable_values_segments, :segmentation_variable_value_id, name: 'segments_to_values_value_id'
  end
end
