# -*- encoding : utf-8 -*-
class AddsUniversityToUsers < ActiveRecord::Migration
  def up
    add_column :users, :university_id, :integer

    add_index :users, :university_id
  end

  def down
    remove_index :users, column: :university_id

    remove_column :users, :university_id
  end
end
