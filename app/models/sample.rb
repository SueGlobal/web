# -*- encoding : utf-8 -*-
class Sample < ActiveRecord::Base
  belongs_to :index
  belongs_to :periodicity
  belongs_to :source
  attr_accessible :methodology_url, :taken_at

  class << self
    def from_index index
      Sample.new.tap do |obj|
        obj.source = index.source
        obj.periodicity = index.periodicity
        obj.methodology_url = index.methodology_url
        obj.index = index
        # obj.segments = index.segments
      end
    end
  end
end
