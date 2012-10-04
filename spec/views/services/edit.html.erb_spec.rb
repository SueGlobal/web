# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "services/edit" do
  before(:each) do
    @service = assign(:service, create(:service))
  end

  it "renders the edit service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edit_service_path(@service), :method => "post" do
    end
  end
end
