# -*- encoding : utf-8 -*-
class AddSlugToOtherStudies < ActiveRecord::Migration
  def change
    add_column :other_studies, :slug, :text
    add_index :other_studies, :slug
  end
end
