class AddConfirmedToIndices < ActiveRecord::Migration
  def change
    add_column :indices, :confirmed, :boolean
    add_index :indices, :confirmed
  end
end
