# -*- encoding : utf-8 -*-
class ChangeOtherDescriptionToOtherInPublicationQuestions < ActiveRecord::Migration
  def up
    rename_column :publication_questions, :other_description, :other
  end

  def down
    rename_column :publication_questions, :other, :other_description
  end
end
