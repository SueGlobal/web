# -*- encoding : utf-8 -*-
shared_examples "a study controller" do |model, *actions|
  it_behaves_like "a university dependent model controller", model, *actions

end
