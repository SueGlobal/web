class FieldWorkQuestion < ActiveRecord::Base
  attr_accessible :email, :focus_group, :internet, :interview, :mail, :other, :phone

  belongs_to :studiable, polymorphic: true
end
