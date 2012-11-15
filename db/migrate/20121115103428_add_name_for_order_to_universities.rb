# -*- encoding : utf-8 -*-
class AddNameForOrderToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :name_for_order, :string
    add_index :universities, :name_for_order
  end
end
