# -*- encoding : utf-8 -*-
class AddInformativeToIndices < ActiveRecord::Migration
  def change
    add_column :indices, :informative, :boolean
    add_index :indices, :informative
  end
end
