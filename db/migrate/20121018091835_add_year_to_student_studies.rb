class AddYearToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :year, :integer
  end
end
