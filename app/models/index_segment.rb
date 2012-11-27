# -*- encoding : utf-8 -*-
class IndexSegment < ActiveRecord::Base
  belongs_to :index
  belongs_to :segment
  # attr_accessible :title, :body
end
