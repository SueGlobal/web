# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Index do

  describe "attributes" do
    subject { create :index }

    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :methodology_url }
    it { should allow_mass_assignment_of :informative }
    it { should allow_mass_assignment_of :periodicity_attributes }
    it { should allow_mass_assignment_of :source_id }
    it { should allow_mass_assignment_of :segment_ids }
    it { should allow_mass_assignment_of :parent_id }
    it { should_not allow_mass_assignment_of :root }
    it { should_not allow_mass_assignment_of :slug }

    it { should belong_to :source }
    it { should belong_to :periodicity }
    it { should belong_to :parent }

    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :methodology_url }

    it { should have_many :index_segments }
    it { should have_many :samples }
    it { should have_many(:segments).through(:index_segments) }
    it { should have_many(:segmentation_variables).through(:segments) }
    it { should have_many(:children) }

    it { should accept_nested_attributes_for(:periodicity) }
  end
end
