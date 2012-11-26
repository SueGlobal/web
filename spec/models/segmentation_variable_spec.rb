# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SegmentationVariable do

  describe "attributes" do
    subject { create :segmentation_variable }

    it { should allow_mass_assignment_of :name }
    it { should_not allow_mass_assignment_of :slug }

    it { should validate_presence_of(:name) }

    it { should have_many(:segmentation_variable_values).order('"order" ASC') }

    it { should have_many(:segments).order('"name" ASC') }
  end

  describe "#clean_attributes" do
    let(:variable) { create :segmentation_variable, value_count: 3 }
    let(:unclean_attributes) do
      clean_attributes.deep_dup.tap do |attr|
        other_value = create :segmentation_variable_value
        attr["segmentation_variable_values_attributes"][other_value.id.to_s] = other_value.attributes.extract! "order", "value"
      end
    end
    let(:clean_attributes) do
      variable.attributes.extract!("name").tap do |attr|
        attr["segmentation_variable_values_attributes"] = {}
        variable.segmentation_variable_values.each do |value|
          attr["segmentation_variable_values_attributes"][value.id.to_s] = value.attributes.extract! "order", "value"
        end
      end
    end

    it "cleans the attributes for values" do
      expect(variable.clean_attributes(unclean_attributes)).to eq(clean_attributes)
    end
  end

  describe "#clean_update_attributes" do
    let(:variable) { create :segmentation_variable }
    it "calls update attributes with whatever is returned from clean_attributes" do
      params = Object.new
      clean_params = Object.new
      updated = Object.new
      variable.should_receive(:clean_attributes).with(params).and_return clean_params
      variable.should_receive(:update_attributes).with(clean_params).and_return updated

      expect(variable.clean_update_attributes params).to be(updated)
    end
  end
end
