# -*- encoding : utf-8 -*-
class ChangeStudyPeriodicitiesToUsePeriodicities < ActiveRecord::Migration
  def up
    remove_column :study_periodicity_questions, :periodicity
    remove_column :study_periodicity_questions, :other_description

    add_column :study_periodicity_questions, :periodicity_id, :integer
    add_index :study_periodicity_questions, :periodicity_id
  end

  def down
    remove_index :study_periodicity_questions, :periodicity_id
    remove_column :study_periodicity_questions, :periodicity_id

    add_column :study_periodicity_questions, :periodicity, :string
    add_column :study_periodicity_questions, :other_description, :text
  end
end
