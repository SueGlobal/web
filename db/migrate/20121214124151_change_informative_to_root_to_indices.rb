class ChangeInformativeToRootToIndices < ActiveRecord::Migration
  def up
    rename_column :indices, :informative, :root
  end
end
