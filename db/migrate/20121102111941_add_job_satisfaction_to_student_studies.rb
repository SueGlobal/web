class AddJobSatisfactionToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :variable_job_satisfaction, :boolean
  end
end
