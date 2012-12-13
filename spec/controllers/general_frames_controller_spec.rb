# -*- encoding : utf-8 -*-
require 'spec_helper'

describe GeneralFramesController do
  it_behaves_like "a university dependent model controller", GeneralFrame,
    :index, :show, :new, :edit, :create, :update, :destroy

  describe "GET evolution" do
    let(:university) { create :university }
    let(:general_frames) { create_list :general_frame, 3, university: university }

    before :each do
      get :evolution, {university_id: university.to_param}, {}
    end

    it "sets university as an instance variable" do
      expect(assigns(:university)).to eq(university)
    end

    it "sets a general frame evolution to an instance variable" do
      expect(assigns(:evolution)).to be_a(GeneralFrameEvolution)
    end

    it "renders 'evolution template'" do
      expect(response).to render_template('evolution')
    end
  end
end
