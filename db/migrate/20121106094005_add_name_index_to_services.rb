# -*- encoding : utf-8 -*-
class AddNameIndexToServices < ActiveRecord::Migration
  def change
    add_index :services, :name
  end
end
