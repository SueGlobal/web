# -*- encoding : utf-8 -*-
class Source < ActiveRecord::Base
  attr_accessible :name, :uri

  validates :name,
    presence: true
end
