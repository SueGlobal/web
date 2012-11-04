# -*- encoding : utf-8 -*-
class SourceQuestion < ActiveRecord::Base
  belongs_to :studiable, polymorphic: true
  attr_accessible :bias, :data_format, :source
end
