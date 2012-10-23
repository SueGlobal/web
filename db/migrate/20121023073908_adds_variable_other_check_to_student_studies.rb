# -*- encoding : utf-8 -*-
class AddsVariableOtherCheckToStudentStudies < ActiveRecord::Migration
  def up
    add_column :student_studies, :variable_other_check, :boolean
  end

  def down
    remove_column :student_studies, :variable_other_check
  end
end
