# -*- encoding : utf-8 -*-
class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :dependency
      t.references :university

      t.timestamps
    end
    add_index :services, :university_id
  end
end
