# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "services/new" do
  let(:service) { create :service }
  let(:university) { service.university }
  before(:each) do
    assign(:university, university)
    assign(:service, service)
  end

  it "renders new service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => university_services_path([university, service]), :method => "post" do
    end
  end
end
