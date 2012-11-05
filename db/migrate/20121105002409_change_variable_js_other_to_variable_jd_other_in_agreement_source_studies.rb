# -*- encoding : utf-8 -*-
class ChangeVariableJsOtherToVariableJdOtherInAgreementSourceStudies < ActiveRecord::Migration
  def up
    rename_column :agreement_source_studies, :variable_js_other, :variable_jd_other
  end

  def down
    rename_column :agreement_source_studies, :variable_jd_other, :variable_js_other
  end
end
