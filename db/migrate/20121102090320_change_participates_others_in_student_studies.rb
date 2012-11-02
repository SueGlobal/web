# -*- encoding : utf-8 -*-
class ChangeParticipatesOthersInStudentStudies < ActiveRecord::Migration
  def up
    change_column :student_studies, :participates_others, :text
  end

  def down
    change_column :student_studies, :participates_others, :boolean
  end
end
