# -*- encoding : utf-8 -*-
require 'spec_helper'

describe University do

  subject { create :university }

  it{ should allow_mass_assignment_of(:name) }
  it{ should allow_mass_assignment_of(:abbreviation) }

  it{ should validate_presence_of(:name) }
  it{ should validate_uniqueness_of(:name) }

  it{ should validate_presence_of(:abbreviation) }
  it{ should validate_uniqueness_of(:abbreviation) }

  it{ should belong_to(:province) }
end
