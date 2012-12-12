# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SampleValue do

  describe "attributes" do
    subject { create :sample_value }

    it { should_not allow_mass_assignment_of(:value_in_cents) }
    it { should allow_mass_assignment_of(:value) }
    it { should allow_mass_assignment_of(:segmentation_variable_values_ids) }

    it { should belong_to(:sample) }
    it { should have_and_belong_to_many(:segmentation_variable_values) }
  end

  describe "#value" do
    it "returns value_in_cents expreseed as float" do
      value = build :sample_value
      value.should_receive(:value_in_cents).and_return(3456)
      expect(value.value).to eql(34.56)
    end
  end

  describe "#value=" do
    it "sets the value_in_cents to an integer for the passed value" do
      value = build :sample_value
      value.should_receive(:value_in_cents=).with(3456)
      value.value = 34.56
    end
  end
end
