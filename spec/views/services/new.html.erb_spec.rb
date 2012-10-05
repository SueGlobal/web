# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "services/new" do
  let(:service) { university.services.build }
  let(:university) { create :university }
  before(:each) do
    assign(:university, university)
    assign(:service, service)
    assign(:path, [university, service])
  end

  it "renders new service form" do
    render

    assert_select "form", :action => university_services_path([university, service]), :method => "post" do
    end
  end
end
