# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AchievedActivity do
  subject { create :achieved_activity }

  AchievedActivity::ACTIVITIES.each do |activity|
    it { should allow_mass_assignment_of(activity) }
  end

  AchievedActivity::SOURCES.each do |source|
    it { should allow_mass_assignment_of(source) }
  end

  it { should allow_mass_assignment_of(:year) }
  it { should validate_numericality_of(:year).only_integer }
end
