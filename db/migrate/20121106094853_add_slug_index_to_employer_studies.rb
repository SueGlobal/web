# -*- encoding : utf-8 -*-
class AddSlugIndexToEmployerStudies < ActiveRecord::Migration
  def change
    add_index :employer_studies, :slug
  end
end
