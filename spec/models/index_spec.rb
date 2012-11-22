# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Index do

  describe "attributes" do
    subject { create :index }

    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :methodology_url }
    it { should allow_mass_assignment_of :informative }
    it { should_not allow_mass_assignment_of :slug }

    it { should belong_to :source }
    it { should belong_to :periodicity }

    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :methodology_url }

    it { should have_many :index_segmentation_variables }
    it { should have_many(:segmentation_variables).through(:index_segmentation_variables) }
  end
end
