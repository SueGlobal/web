# -*- encoding : utf-8 -*-
class AddUniversityIdIndexToStudentStudies < ActiveRecord::Migration
  def change
    add_index :student_studies, :university_id
  end
end
