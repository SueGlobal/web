# -*- encoding : utf-8 -*-
require 'spec_helper'

describe IndexSegmentationVariable do
  subject { create :index_segmentation_variable }

  it { should allow_mass_assignment_of :primary }

  it { should belong_to :index }
  it { should belong_to :segmentation_variable }
end
