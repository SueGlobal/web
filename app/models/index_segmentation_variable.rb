# -*- encoding : utf-8 -*-
class IndexSegmentationVariable < ActiveRecord::Base
  belongs_to :index
  belongs_to :segmentation_variable
  attr_accessible :primary

  default_scope do
    includes(:index, :segmentation_variable)
  end
end
