# -*- encoding : utf-8 -*-
class AddUniversityReferenceToEmployerStudies < ActiveRecord::Migration
  def change
    add_column :employer_studies, :university_id, :integer
    add_index :employer_studies, :university_id
  end
end
