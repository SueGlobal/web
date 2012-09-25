# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :province
end
