# -*- encoding : utf-8 -*-
require 'spec_helper'

describe University do

  subject { create :university }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:abbreviation) }
  it { should allow_mass_assignment_of(:community_id) }
  it { should allow_mass_assignment_of(:admin_emails) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:abbreviation) }
  it { should validate_uniqueness_of(:abbreviation) }

  it { should belong_to(:community) }
  it { should have_many(:users) }
  it { should have_many(:services) }
  it { should have_many(:student_studies) }
  it { should have_many(:employer_studies) }
  it { should have_many(:public_source_studies) }
  it { should have_many(:other_studies) }

  it { should be_a(FriendlyId) }
  it { should respond_to(:name_for_slug) }
end
