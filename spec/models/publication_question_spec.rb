require 'spec_helper'

describe PublicationQuestion do

  subject { create :publication_question }

  it { should allow_mass_assignment_of(:app_check) }
  it { should allow_mass_assignment_of(:dynamic_web_check) }
  it { should allow_mass_assignment_of(:dynamic_web_url) }
  it { should allow_mass_assignment_of(:limited_distribution_check) }
  it { should allow_mass_assignment_of(:multimedia_check) }
  it { should allow_mass_assignment_of(:other_check) }
  it { should allow_mass_assignment_of(:other_description) }
  it { should allow_mass_assignment_of(:papers_check) }
  it { should allow_mass_assignment_of(:pdf_check) }
  it { should allow_mass_assignment_of(:static_web_check) }
  it { should allow_mass_assignment_of(:static_web_url) }
  it { should allow_mass_assignment_of(:thesis_check) }
  it { should allow_mass_assignment_of(:with_isbn_check) }
  it { should allow_mass_assignment_of(:without_isbn_check) }

  it { should belong_to(:information_question) }
end
