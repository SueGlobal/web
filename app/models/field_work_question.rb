# -*- encoding : utf-8 -*-
class FieldWorkQuestion < ActiveRecord::Base
  attr_accessible :email, :focus_group, :internet,
                  :interview, :mail, :other, :phone,
                  :questionnaire_link, :other_check

  belongs_to :studiable, polymorphic: true
end
