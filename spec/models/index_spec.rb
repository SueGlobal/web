# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Index do

  describe "attributes" do
    subject { create :index }

    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :methodology_url }
    it { should allow_mass_assignment_of :informative }
    it { should allow_mass_assignment_of :periodicity_id }
    it { should allow_mass_assignment_of :source_id }
    it { should allow_mass_assignment_of :segments_ids }
    it { should_not allow_mass_assignment_of :slug }

    it { should belong_to :source }
    it { should belong_to :periodicity }

    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :methodology_url }

    it { should have_many :index_segments }
    it { should have_many(:segments).through(:index_segments) }
    it { should have_many(:segmentation_variables).through(:segments) }
  end
end
