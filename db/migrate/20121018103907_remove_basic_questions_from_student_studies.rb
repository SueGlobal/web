class RemoveBasicQuestionsFromStudentStudies < ActiveRecord::Migration
  def up
    remove_column :student_studies, :title
    remove_column :student_studies, :author
    remove_column :student_studies, :population
    remove_column :student_studies, :year
  end

  def down
    add_column :student_studies, :title, :text
    add_column :student_studies, :author, :text
    add_column :student_studies, :population, :text
    add_column :student_studies, :year, :integer
  end
end
