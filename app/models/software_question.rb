# -*- encoding : utf-8 -*-
class SoftwareQuestion < ActiveRecord::Base
  attr_accessible :description, :uses_some

  belongs_to :studiable, polymorphic: true
end
