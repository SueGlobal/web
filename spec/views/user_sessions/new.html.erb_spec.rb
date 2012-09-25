# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "user_sessions/new.html.erb" do
  it "should render form partial" do
    render
    view.should render_template(partial: '_form', count: 1)
  end

  it "should render forgot_password_form partial" do
    render
    view.should render_template(partial: '_forgot_password_form', count: 1)
  end
end
