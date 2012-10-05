# -*- encoding : utf-8 -*-
require 'spec_helper'

describe GeneralFramesController do

  def valid_attributes
    attributes_for :general_frame
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GeneralFramesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:general_frame) { create :general_frame }
  let(:university) { general_frame.university }

  describe "GET index" do
    let(:user) { nil }

    it "assigns all general_frames as @general_frames" do
      other_general_frame = create :general_frame
      get :index, {university_id: university.to_param}, valid_session
      assigns(:general_frames).should eq([general_frame])
    end
  end

  describe "GET show" do
    let(:user) { nil }

    it "assigns the requested general_frame as @general_frame" do
      get :show, {id: general_frame.to_param}, valid_session
      assigns(:general_frame).should eq(general_frame)
    end
  end

  describe "GET new" do
    context "when there is no user" do
      let(:user) { nil }
      before :each do
        get :new, {university_id: university.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user logged in" do
      let(:user) { create :user }


      it "assigns a new general_frame as @general_frame" do
        get :new, {university_id: university.to_param}, valid_session
        assigns(:general_frame).should be_a_new(GeneralFrame)
      end

      context "and cannot 'new' general frames" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          get :new, {university_id: university.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "GET edit" do

    context "when there is no user" do
      let(:user) { nil }

      before :each do
        get :edit, {id: general_frame.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user logged in" do
      let(:user) { create :user }

      context "and it can 'edit' the general frame" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :edit, {:id => general_frame.to_param}, valid_session
        end

        it "assigns the resource as @resource" do
          assigns(:general_frame).should eq(general_frame)
        end
      end

      context "and it cannot 'edit' the general_frame" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          get :edit, {:id => general_frame.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "POST create" do

    def post_create
      post  :create,
            { university_id: university.to_param,
              :general_frame => valid_attributes},
            valid_session
    end

    context "when there is no user logged in" do
      let(:user) { nil }

      before :each do
        post_create
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user logged in" do
      let(:user) { create :user }

      context "when user can 'create' general frames" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "creates a new GeneralFrame" do
            university
            expect {
              post_create
            }.to change(GeneralFrame, :count).by(1)
          end

          it "assigns a newly created general_frame as @general_frame" do
            post_create
            assigns(:general_frame).should be_a(GeneralFrame)
            assigns(:general_frame).should be_persisted
          end

          it "redirects to the created general_frame" do
            post_create
            response.should redirect_to(GeneralFrame.last)
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved general_frame as @general_frame" do
            # Trigger the behavior that occurs when invalid params are submitted
            GeneralFrame.any_instance.stub(:save).and_return(false)
            post_create
            assigns(:general_frame).should be_a_new(GeneralFrame)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            GeneralFrame.any_instance.stub(:save).and_return(false)
            post_create
            response.should render_template("new")
          end
        end
      end

      context "when user cannot 'create' general frames" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          post_create
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "PUT update" do

    def put_update attrs=nil
      attrs ||= valid_attributes
      put :update, {:id => general_frame.to_param, :general_frame => attrs}, valid_session
    end

    context "when there is no user logged in" do
      let(:user) { nil }

      before :each do
        put_update
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user logged in" do

      let(:user) { create :user }

      context "and can 'edit' the general frame" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "updates the requested general_frame" do
            GeneralFrame.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put_update 'these' => 'params'
          end

          it "assigns the requested general_frame as @general_frame" do
            put_update
            assigns(:general_frame).should eq(general_frame)
          end

          it "redirects to the general_frame" do
            put_update
            response.should redirect_to(general_frame)
          end
        end

        describe "with invalid params" do
          before :each do
            GeneralFrame.any_instance.stub(:save).and_return(false)
            put_update({})
          end

          it "assigns the general_frame as @general_frame" do
            assigns(:general_frame).should eq(general_frame)
          end

          it "re-renders the 'edit' template" do
            response.should render_template("edit")
          end
        end
      end

      context "when user cannot 'edit' the general frame" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          put_update
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "DELETE destroy" do

    def delete_destroy id=nil
      id ||= general_frame.to_param
      delete :destroy, {:id => id}, valid_session
    end


    context "when no user is logged in" do
      let(:user) { nil }

      before :each do
        delete_destroy
      end

      it_behaves_like "user is not authenticated"
    end

    context "when a user is logged in" do
      let(:user) { create :user }

      context "and can 'destroy' the general frame" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        it "destroys the requested general_frame" do
          general_frame
          expect {
            delete_destroy
          }.to change(GeneralFrame, :count).by(-1)
        end

        it "redirects to the general_frames list" do
          general_frame
          delete_destroy
          response.should redirect_to(general_frame.university)
        end
      end

      context "and cannot 'destroy' the general frame" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
        end

        it "do not destroy the requested general_frame" do
          general_frame
          expect {
            delete_destroy
          }.not_to change(GeneralFrame, :count)
        end

        it_behaves_like "user is not authenticated" do
          before :each do
            delete_destroy
          end
        end
      end
    end
  end

end
