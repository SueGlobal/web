# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UniversityChangeRequestController do

  describe "GET 'accept'" do
    let(:user) { create :user }
    let(:university) { create :university }
    let(:ucr) { create :university_change_request, :pending }

    before :each do
      get 'accept', {token: ucr.token}, {}
    end

    it "redirects to root" do
      expect(response).to redirect_to(root_path)
    end

    it "sets the flash" do
      expect(flash[:notice]).not_to be_blank
    end

    it "sets the ucr to done" do
      expect(ucr.reload).to be_done
    end
  end
end
