# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UniversitiesController do

  def valid_attributes
    attributes_for(:university).tap do |attr|
      attr.delete :slug
    end
  end

  def valid_session
    {}
  end

  let!(:university) { create :university }

  describe "GET index" do
    it "assigns all universities as @universities" do
      get :index, {}, valid_session
      assigns(:universities).should eq([university])
    end
  end

  describe "GET show" do
    it "assigns the requested university as @university" do
      get :show, {:id => university.to_param}, valid_session
      assigns(:university).should eq(university)
    end
  end

  describe "GET new" do

    before :each do
      login_user user if user
    end

    context "when there is no user" do
      let(:user) { nil }

      before :each do
        get :new, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when logged in" do
      let(:user) { create :user }

      context "when can 'new' the university" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          get :new, {}, valid_session
        end

        it "assigns a new university as @university" do
          assigns(:university).should be_a_new(University)
        end

        it "renders new template" do
          response.should render_template('new')
        end
      end

      context "when cannot 'new' the university" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :new, {}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "GET edit" do
    before :each do
      login_user user if user
    end
    context "when there is no user" do

      let(:user) { nil }
      let(:university) { create :university }

      before :each do
        get :edit, {id: university.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when logged in" do
      let(:university) { create :university }
      let(:user) { create :user }

      context "and can edit university" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          get :edit, {id: university.to_param}, valid_session
        end

        it "assigns the requested university as @university" do
          assigns(:university).should eq(university)
        end

        it "renders edit template" do
          response.should render_template('edit')
        end
      end

      context "and cannot edit university" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :edit, {id: university.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "POST create" do

    context "when not logged in" do
      before :each do
        post :create, {university: valid_attributes}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when logged in" do
      let (:user) { create :user }
      before :each do
        login_user user
      end

      context "when user cannot create universities" do
        before :each do
          controller.should_receive(:authorize!).and_raise(CanCan::AccessDenied)
          post :create, {university: valid_attributes}, valid_session
        end

        it_behaves_like "user is not authorized"
      end

      context "when user can create universities" do

        before :each do
          controller.should_receive(:authorize!).and_return(true)
        end

        describe "with valid params" do
          it "creates a new University" do
            expect {
              post :create, {:university => valid_attributes}, valid_session
            }.to change(University, :count).by(1)
          end

          it "assigns a newly created university as @university" do
            post :create, {:university => valid_attributes}, valid_session
            assigns(:university).should be_a(University)
            assigns(:university).should be_persisted
          end

          it "redirects to the created university" do
            post :create, {:university => valid_attributes}, valid_session
            response.should redirect_to(University.last)
          end

          it "sets flash" do
            post :create, {:university => valid_attributes}, valid_session
            should set_the_flash
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved university as @university" do
            # Trigger the behavior that occurs when invalid params are submitted
            University.any_instance.stub(:save).and_return(false)
            post :create, {:university => {}}, valid_session
            assigns(:university).should be_a_new(University)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            University.any_instance.stub(:save).and_return(false)
            post :create, {:university => {}}, valid_session
            response.should render_template("new")
          end
        end
      end
    end
  end

  describe "PUT update" do
    before :each do
      login_user user if user
    end

    context "when not logged in" do
      let(:user) { nil }

      before :each do
        put :update, {id: university.to_param, university: {}}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when logged in" do
      let(:user) { create :user, :active }
      let(:university) { create :university }

      context "when user can update it" do
        before :each do
          controller.should_receive(:authorize!).and_return(true)
        end

        describe "with valid params" do
          it "updates the requested university" do
            University.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put :update, {:id => university.to_param, :university => {'these' => 'params'}}, valid_session
          end

          it "assigns the requested university as @university" do
            put :update, {:id => university.to_param, :university => valid_attributes}, valid_session
            assigns(:university).should eq(university)
          end

          it "redirects to the university" do
            put :update, {:id => university.to_param, :university => valid_attributes}, valid_session
            response.should redirect_to(university)
          end

          it "sets the flash" do
            put :update, {:id => university.to_param, :university => valid_attributes}, valid_session
            should set_the_flash
          end
        end

        describe "with invalid params" do
          it "assigns the university as @university" do
            University.any_instance.stub(:update_attributes).and_return(false)
            put :update, {id: university.to_param, :university => {}}, valid_session
            assigns(:university).should eq(university)
          end

          it "re-renders the 'edit' template" do
            University.any_instance.stub(:update_attributes).and_return(false)
            put :update, {id: university.to_param, :university => {}}, valid_session
            response.should render_template("edit")
          end
        end
      end

      context "when user cannot update it" do
        before :each do
          controller.should_receive(:authorize!).and_raise(CanCan::AccessDenied)
          put :update, {id: university.to_param, university: {}}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      login_user user if user
    end

    let(:university) { create :university }

    context "when user is not logged in" do

      let(:user) { nil }

      before :each do
        delete :destroy, {id: university.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can destroy university" do
      let(:user) { create :user }
      before :each do
        controller.should_receive(:authorize!).and_return(true)
      end

      it "destroys the requested university" do
        expect {
          delete :destroy, {:id => university.to_param}, valid_session
        }.to change(University, :count).by(-1)
      end

      it "redirects to the universities list" do
        delete :destroy, {:id => university.to_param}, valid_session
        response.should redirect_to(universities_url)
      end
    end

    context "when user cannot destroy university" do
      let(:user) { create :user }
      before :each do
        controller.should_receive(:authorize!).and_raise(CanCan::AccessDenied)
        delete :destroy, {id: university.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end
  end
end
