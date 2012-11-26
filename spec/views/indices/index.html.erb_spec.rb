# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "indices/index" do
  before(:each) do
    assign(:indices, IndexDecorator.decorate([
           create(:index),
           create(:index)
    ]))
  end

  it "renders a list of indices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
