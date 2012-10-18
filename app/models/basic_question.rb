class BasicQuestion < ActiveRecord::Base
  attr_accessible :author, :population, :title, :year

  belongs_to :studiable, polymorphic: true
end
