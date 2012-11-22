# -*- encoding : utf-8 -*-
class Index < ActiveRecord::Base
  belongs_to :source
  belongs_to :periodicity
  attr_accessible :description, :methodology_url, :name, :informative

  validates_presence_of:name, :description, :methodology_url
end
