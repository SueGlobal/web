# -*- encoding : utf-8 -*-
class CreateEmployerStudies < ActiveRecord::Migration
  def change
    create_table :employer_studies do |t|
      t.boolean :variable_selection_process
      t.boolean :variable_extra_experience
      t.boolean :variable_offer_requirements
      t.boolean :variable_contract_characteristics
      t.boolean :variable_knowledge_evaluation
      t.boolean :variable_competence_evaluation
      t.text :variable_other
      t.boolean :segmentation_variable_activity_sector
      t.boolean :segmentation_variable_organization_size
      t.boolean :segmentation_variable_companies_using_ues
      t.boolean :segmentation_variable_companies_hiring_graduates
      t.text :segmentation_variable_others
      t.boolean :segmentation_variable_no_segmentation
      t.string :slug, null: false

      t.timestamps
    end
  end
end
