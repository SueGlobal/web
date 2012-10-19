# -*- encoding : utf-8 -*-
class AddParticipatesOtherUniversitiesToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :participates_other_universities, :boolean
  end
end
