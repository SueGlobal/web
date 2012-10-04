# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "services/index" do
  let(:university) { create :university }
  before(:each) do
    assign(:university, university)
    assign(:services, [
           create(:service, university: university),
           create(:service, university: university)
    ])
  end

  it "renders a list of services" do
    render
  end
end
