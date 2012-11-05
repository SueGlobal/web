# -*- encoding : utf-8 -*-
class AddAgreementDataToAgreementSourceStudies < ActiveRecord::Migration
  def change
    add_column :agreement_source_studies, :agreement_signers, :text
    add_column :agreement_source_studies, :agreement_transience, :text
  end
end
