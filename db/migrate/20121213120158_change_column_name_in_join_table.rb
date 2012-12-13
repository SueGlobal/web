# -*- encoding : utf-8 -*-
class ChangeColumnNameInJoinTable < ActiveRecord::Migration
  def change
    rename_column :sample_values_segmentation_variable_values, :sample_values_id, :sample_value_id
    rename_column :sample_values_segmentation_variable_values, :segmentation_variable_values_id, :segmentation_variable_value_id
  end
end
