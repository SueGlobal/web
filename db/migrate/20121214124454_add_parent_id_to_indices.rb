class AddParentIdToIndices < ActiveRecord::Migration
  def change
    add_column :indices, :parent_id, :integer
    add_index :indices, :parent_id
  end
end
