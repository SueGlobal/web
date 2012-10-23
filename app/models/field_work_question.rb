# -*- encoding : utf-8 -*-
class FieldWorkQuestion < ActiveRecord::Base
  attr_accessible :email, :focus_group, :internet,
                  :interview, :mail, :other, :phone,
                  :questionnaire_link

  belongs_to :studiable, polymorphic: true
end
