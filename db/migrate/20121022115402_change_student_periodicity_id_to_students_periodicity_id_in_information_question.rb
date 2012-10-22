class ChangeStudentPeriodicityIdToStudentsPeriodicityIdInInformationQuestion < ActiveRecord::Migration
  def up
    rename_column :information_questions, :student_periodicity_id, :students_periodicity_id
  end

  def down
    rename_column :information_questions, :students_periodicity_id, :student_periodicity_id
  end
end
