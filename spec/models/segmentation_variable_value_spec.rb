# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SegmentationVariableValue do
  subject { create :segmentation_variable_value }

  it { should allow_mass_assignment_of(:value) }
  it { should allow_mass_assignment_of(:order) }

  it { should belong_to(:segmentation_variable) }

  it { should validate_presence_of(:value) }
  it { should validate_presence_of(:order) }
  it { should validate_numericality_of(:order).only_integer }
end
