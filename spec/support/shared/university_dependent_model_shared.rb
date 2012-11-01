# -*- encoding : utf-8 -*-
shared_examples "a university dependent model" do
  it { should belong_to(:university) }

  it { should be_a(FriendlyId) }
  it { should respond_to(:name_for_slug) }
  it { should respond_to(:column_for_slug) }

  it { should validate_presence_of(:slug) }
end
