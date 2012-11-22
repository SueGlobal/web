# -*- encoding : utf-8 -*-
class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.string :slug
      t.text :name
      t.text :description
      t.references :source
      t.references :periodicity
      t.text :methodology_url

      t.timestamps
    end
    add_index :indices, :slug, unique: true
    add_index :indices, :source_id
    add_index :indices, :periodicity_id
  end
end
