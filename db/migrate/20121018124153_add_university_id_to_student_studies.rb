# -*- encoding : utf-8 -*-
class AddUniversityIdToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :university_id, :integer
  end
end
