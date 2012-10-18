# -*- encoding : utf-8 -*-
class AddStudiablePolymorphicAssociationToSoftwareQuestions < ActiveRecord::Migration
  def change
    add_column :software_questions, :studiable_id, :integer
    add_column :software_questions, :studiable_type, :string
  end
end
