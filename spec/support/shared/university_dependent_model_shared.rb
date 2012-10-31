# -*- encoding : utf-8 -*-
shared_examples "a university dependent model" do
  it { should belong_to(:university) }
end
