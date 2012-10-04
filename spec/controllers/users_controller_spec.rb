# -*- encoding : utf-8 -*-
require 'spec_helper'


describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    before :each do
      login_user user if user
    end

    context "when user can index users" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
      end

      it "assigns all users as @users" do
        get :index, {}, valid_session
        assigns(:users).should eq([user])
      end
    end

    context "when user cannot index users" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
      end

      it "behaves as unauthorized" do
        get :index, {}, valid_session
        behave_as_unauthorized
      end
    end
  end

  describe "GET show" do
    let(:other_user) { create :user }

    before :each do
      login_user user if user
    end

    context "when not logged in" do
      let(:user) { nil }

      before :each do
        get :show, {id: other_user.to_param}, valid_session
      end

      it "behaves as not authenticated" do
        behave_as_not_authenticated
      end
    end

    context "when logged in" do
      let(:user) { create :user }

      context "when can see the requested user" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          get :show, {id: other_user.to_param}, valid_session
        end

        it "assign other_user as @user" do
          assigns(:user).should eq(other_user)
        end
      end

      context "when cannot see the requested user" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
        end

        it "behaves as unauthorized" do
          get :show, {id: other_user.to_param}, valid_session
          behave_as_unauthorized
        end
      end
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    let(:other_user) { create :user }

    before :each do
      login_user user if user
    end

    context "when not logged in" do
      let(:user) { nil }

      it "behaves as not authenticated" do
        get :edit, {id: other_user.to_param}, valid_session
        behave_as_not_authenticated
      end
    end

    context "when logged in" do
      let(:user) { create :user, :active }

      context "when can edit the requested user" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          get :edit, {id: other_user.to_param}, valid_session
        end

        it "assigns the requested user as user" do
          assigns(:user).should eq(other_user)
        end
      end
      context "when cannot edit the requested user" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :edit, {id: other_user.to_param}, valid_session
        end

        it "behaves as unauthorized" do
          behave_as_unauthorized
        end
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {user: valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {user: valid_attributes}, valid_session
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to root" do
        post :create, {user: valid_attributes}, valid_session
        response.should redirect_to(root_path)
      end

      it "sends an email" do
        lambda{
          post :create, {user: valid_attributes}, valid_session
        }.should change{ number_of_emails }.by(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {user: {}}, valid_session
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {user: {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:other_user) { create :user, :active }

    before :each do
      login_user user if user
    end

    context "when not logged in" do
      let(:user) { nil }

      it "behaves as not authenticated" do
        put :update, {id: other_user.to_param,
                      user: {}},
                      valid_session
      end
    end

    context "when logged in" do
      let(:user) { create :user }

      context "when user can edit requested user" do

        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        context "with valid params" do

          it "updates the requested user" do
            User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put :update, {id: user.to_param, user: {'these' => 'params'}}, valid_session
          end

          it "assigns the requested user as @user" do
            put :update, {id: user.to_param, user: valid_attributes}, valid_session
            assigns(:user).should eq(user)
          end

          it "redirects to the user" do
            put :update, {id: user.to_param, user: valid_attributes}, valid_session
            response.should redirect_to(user)
          end

          it "cannot modify its email" do
            put :update, {id: user.to_param,
                          user: {'email' => 'other_email@example.com'}},
                          valid_session
            user.reload.email.should_not eq('other_email@example.com')
          end
        end

        context "with invalid params" do

          it "assigns the user as @user" do
            User.any_instance.stub(:save).and_return(false)
            put :update, {id: other_user.to_param, user: {}}, valid_session
            assigns(:user).should eq(other_user)
          end

          it "re-renders the 'edit' template" do
            User.any_instance.stub(:save).and_return(false)
            put :update, {id: other_user.to_param, user: {}}, valid_session
            response.should render_template("edit")
          end
        end
      end

      context "when user cannot edit requested user" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          put :update, {id: other_user.to_param,
                        user: {}},
                        valid_session
        end

        it "behaves as unauthorized" do
          behave_as_unauthorized
        end
      end
    end
  end

  describe "DELETE destroy" do
    let(:other_user) { create :user }

    before :each do
      login_user user if user
    end

    context "when not logged in" do
      let(:user) { nil }

      before :each do
        delete :destroy, {id: other_user.to_param}, valid_session
      end

      it "behaves as not authenticated" do
        behave_as_not_authenticated
      end
    end

    context "when logged in" do
      let(:user) { create :user, :active }

      context "when can destroy other user" do
        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        it "destroys the requested user" do
          other_user
          expect {
            delete :destroy, {id: other_user.to_param}, valid_session
          }.to change(User, :count).by(-1)
        end

        it "redirects to root" do
          other_user
          delete :destroy, {id: other_user.to_param}, valid_session
          response.should redirect_to(root_path)
        end
      end

      context "when cannot destroy other user" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
        end

        it "does not destroys any user" do
          other_user
          lambda{
            delete :destroy, {id: other_user.to_param}, valid_session
          }.should_not change(User, :count)
        end

        it "behaves as unauthorized" do
          other_user
          delete :destroy, {id: other_user.to_param}, valid_session
          behave_as_unauthorized
        end
      end
    end
  end

  describe 'GET activate' do

    let(:user) { create :user, activation_state: 'pending' }

    context "when valid activation token" do

      before :each do
        get 'activate', {id: user.activation_token}, {}
      end

      it "assigns the proper user" do
        assigns(:user).should eq(user)
      end

      it "activates the user" do
        user.reload.activation_state.should eq('active')
      end
    end

    context "when not valid user" do

      before :each do
        get 'activate', {id: 'p'+user.activation_token}, {}
      end

      it "behaves as not authenticated" do
        response.should redirect_to(root_path)
      end

      it "sets a notice" do
        flash.notice.should_not be_blank
      end
    end
  end
end
