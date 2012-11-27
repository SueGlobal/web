# -*- encoding : utf-8 -*-
class DropIndexSegmentationVariables < ActiveRecord::Migration
  def up
    drop_table(:index_segmentation_variables)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
