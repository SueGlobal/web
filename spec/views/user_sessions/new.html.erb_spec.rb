require 'spec_helper'

describe "user_sessions/new.html.erb" do
  it "should render form partial" do
    render
    view.should render_template(partial: '_form', count: 1)
  end
end
