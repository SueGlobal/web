# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Sample do
  describe "attributes" do
    subject { create :sample }

    it { should belong_to(:index) }
    it { should belong_to(:source) }
    it { should belong_to(:periodicity) }
    it { should have_and_belong_to_many(:segments) }
    it { should have_many(:sample_values) }

    it { should allow_mass_assignment_of(:methodology_url) }
    it { should allow_mass_assignment_of(:taken_at) }
    it { should allow_mass_assignment_of(:sample_values_attributes) }
    it { should allow_mass_assignment_of(:periodicity_attributes) }

    it { should accept_nested_attributes_for(:sample_values) }
    it { should accept_nested_attributes_for(:periodicity) }
  end

  describe ".from_index" do
    let(:source) { mock_model(Source) }
    let(:periodicity) { mock_model(Periodicity) }
    let(:methodology) { "http://methodology.com" }
    let(:segments) { (1..2).to_a.map{ mock_model(Segment) } }
    let(:index) do
      mock_model(Index).tap do |idx|
        idx.should_receive(:source).and_return source
        idx.should_receive(:periodicity).and_return periodicity
        idx.should_receive(:methodology_url).and_return methodology
        idx.should_receive(:segments).and_return segments
      end
    end

    subject { Sample.from_index index }

    it { should be_a_new(Sample) }
    its(:index) { should eql(index) }
    its(:source) { should eql(source) }
    its(:periodicity) { should eql(periodicity) }
    its(:methodology_url) { should eql(methodology) }
    # its(:segments) { should eql(segments) }
  end
end
