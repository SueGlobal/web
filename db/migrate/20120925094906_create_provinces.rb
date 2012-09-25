# -*- encoding : utf-8 -*-
class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.integer :id_prov, null: false
      t.string :name

      t.timestamps
    end
  end
end
