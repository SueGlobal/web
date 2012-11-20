# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SegmentationVariable do
  subject { create :segmentation_variable }

  it { should allow_mass_assignment_of :name }
  it { should_not allow_mass_assignment_of :slug }

  it { should validate_presence_of(:name) }
end
