# -*- encoding : utf-8 -*-
class AddRolesMaskToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles_mask, :integer, default: 0
  end
end
