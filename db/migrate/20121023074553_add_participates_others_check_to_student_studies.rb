# -*- encoding : utf-8 -*-
class AddParticipatesOthersCheckToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :participates_others_check, :boolean
  end
end
