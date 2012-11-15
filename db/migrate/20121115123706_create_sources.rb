# -*- encoding : utf-8 -*-
class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :slug
      t.text :name
      t.text :uri

      t.timestamps
    end
    add_index :sources, :slug
  end
end
