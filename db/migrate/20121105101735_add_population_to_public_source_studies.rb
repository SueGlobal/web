# -*- encoding : utf-8 -*-
class AddPopulationToPublicSourceStudies < ActiveRecord::Migration
  def change
    add_column :public_source_studies, :population, :text
  end
end
