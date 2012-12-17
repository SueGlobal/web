# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Index do

  describe "attributes" do
    context "child index" do
      subject { create :index, root: false }

      it { should allow_mass_assignment_of :name }
      it { should allow_mass_assignment_of :description }
      it { should allow_mass_assignment_of :methodology_url }
      it { should allow_mass_assignment_of :informative }
      it { should allow_mass_assignment_of :periodicity_attributes }
      it { should allow_mass_assignment_of :source_id }
      it { should allow_mass_assignment_of :segment_ids }
      it { should_not allow_mass_assignment_of :slug }

      it { should belong_to :source }
      it { should belong_to :periodicity }

      it { should validate_presence_of :name }
      it { should validate_presence_of :description }
      it { should validate_presence_of :methodology_url }

      it { should have_many :index_segments }
      it { should have_many :samples }
      it { should have_many(:segments).through(:index_segments) }
      it { should have_many(:segmentation_variables).through(:segments) }

      it { should accept_nested_attributes_for(:periodicity) }
    end

    context "root index" do
      subject { create :index, root: true }

      it { should allow_mass_assignment_of :name }
      it { should allow_mass_assignment_of :description }
      it { should allow_mass_assignment_of :methodology_url }
      it { should allow_mass_assignment_of :informative }
      it { should allow_mass_assignment_of :periodicity_attributes }
      it { should allow_mass_assignment_of :source_id }
      it { should allow_mass_assignment_of :segment_ids }
      it { should_not allow_mass_assignment_of :slug }

      it { should belong_to :source }
      it { should belong_to :periodicity }

      it { should validate_presence_of :name }
      it { should validate_presence_of :description }
      it { should_not validate_presence_of :methodology_url }

      it { should have_many :index_segments }
      it { should have_many :samples }
      it { should have_many(:segments).through(:index_segments) }
      it { should have_many(:segmentation_variables).through(:segments) }

      it { should accept_nested_attributes_for(:periodicity) }
    end
  end
end
