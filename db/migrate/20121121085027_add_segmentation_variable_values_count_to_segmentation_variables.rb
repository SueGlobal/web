# -*- encoding : utf-8 -*-
class AddSegmentationVariableValuesCountToSegmentationVariables < ActiveRecord::Migration
  def change
    add_column :segmentation_variables, :segmentation_variable_values_count, :integer, default: 0
  end
end
