# -*- encoding : utf-8 -*-
class AddSlugToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :slug, :string
    add_index :samples, :slug, unique: true
  end
end
