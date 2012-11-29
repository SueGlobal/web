# -*- encoding : utf-8 -*-
class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :index
      t.datetime :taken_at
      t.references :periodicity
      t.references :source
      t.text :methodology_url

      t.timestamps
    end
    add_index :samples, :index_id
    add_index :samples, :periodicity_id
  end
end
