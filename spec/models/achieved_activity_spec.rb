# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AchievedActivity do

  describe "fields accessors" do

    subject { create :achieved_activity }

    AchievedActivity::ACTIVITIES.each do |activity|
      it { should allow_mass_assignment_of(activity) }
    end

    AchievedActivity::SOURCES.each do |source|
      it { should allow_mass_assignment_of(source) }
    end

    it { should allow_mass_assignment_of(:year) }
    #   Done in before filter
    #  it { should validate_numericality_of(:year).only_integer }
    it_behaves_like "a university dependent model"
  end
end
