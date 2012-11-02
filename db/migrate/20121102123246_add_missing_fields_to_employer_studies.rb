# -*- encoding : utf-8 -*-
class AddMissingFieldsToEmployerStudies < ActiveRecord::Migration
  def change
    add_column :employer_studies, :segmentation_variable_others_check, :boolean
    add_column :employer_studies, :variable_other_check, :boolean
    add_column :employer_studies, :notes, :text
  end
end
