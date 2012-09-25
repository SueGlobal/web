# -*- encoding : utf-8 -*-
class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :abbreviation
      t.references :province

      t.timestamps
    end
    add_index :universities, :abbreviation, :unique => true
  end
end
