# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SegmentationVariablesController do

  it_behaves_like "an index related model controller", SegmentationVariable,
    :new, :edit, :create, :update, :destroy

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:variable) { create :segmentation_variable }

  describe "GET index" do
    context "when there is no user" do
      let(:user) { nil }
      before(:each) do
        variable
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user" do
      let(:user) { create :user, :admin }
      context "that can index variables" do

        before :each do
          controller.should_receive(:authorize!).and_return true
          variable
          get :index, {}, valid_session
        end

        it "assigns all variables as an instance variable" do
          expect(assigns(:segmentation_variables)).to eq([variable])
        end
      end

      context "that cannot index variables" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          variable
          get :index, {}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "GET show" do
    context "when there is no user" do
      let(:user) { nil }

      before(:each) do
        get :show, {id: variable.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user" do
      let(:user) { create :user, :admin }

      context "can show the variable" do

        before :each do
          controller.should_receive(:authorize!).and_return true
          get :show, {id: variable.to_param}, valid_session
        end

        it "assigns the variable as an instance variable" do
          expect(assigns(:segmentation_variable)).to eq(variable)
        end

        it "renders the show template" do
          expect(response).to render_template('show')
        end
      end

      context "cannot show the variable" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :show, {id: variable.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end
end
