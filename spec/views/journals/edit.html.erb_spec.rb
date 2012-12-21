require 'spec_helper'

describe "journals/edit" do
  before(:each) do
    @journal = assign(:journal, stub_model(Journal))
  end

  it "renders the edit journal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => journals_path(@journal), :method => "post" do
    end
  end
end
