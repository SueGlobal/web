# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Segment do
  subject { create :segment }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:segmentation_variable_value_ids) }
  it { should_not allow_mass_assignment_of(:slug) }

  it { should belong_to :segmentation_variable }
  it { should have_and_belong_to_many :segmentation_variable_values }

  it { should validate_presence_of :name }
end
