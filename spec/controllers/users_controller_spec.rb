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
        User.should_receive(:all).and_return [user]
        get :index, {}, valid_session
        assigns(:users).should eq([user])
      end
    end

    context "when user cannot index users" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authorized"
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

      it_behaves_like "user is not authenticated"
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
          get :show, {id: other_user.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
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

      before :each do
        get :edit, {id: other_user.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
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

        it_behaves_like "user is not authorized"
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

      before :each do
        put :update, {id: other_user.to_param,
                      user: {}},
                      valid_session
      end

      it_behaves_like "user is not authenticated"
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

        it_behaves_like "user is not authorized"
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

      it_behaves_like "user is not authenticated"
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
          other_user
          lambda{
            delete :destroy, {id: other_user.to_param}, valid_session
          }.should_not change(User, :count)
        end

        it_behaves_like "user is not authorized"
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

  describe 'GET roles' do

    let(:other_user) { create :user, roles: [:admin]}

    before :each do
      login_user user if user
    end


    context "when user is not logged in" do

      let(:user) { nil }

      before :each do
        get 'roles', {id: other_user.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logger in" do

      context "and user is the same as edited user" do
        let(:user) { other_user }

        before :each do
          controller.should_receive(:authorize!).and_return true
          get :roles,
               {id: other_user.to_param},
               valid_session
        end

        it "redirects to root" do
          expect(response).to redirect_to(root_path)
        end

        it "sets flash" do
          expect(flash[:alert]).to be_present
        end
      end

      context "and user is not the same as edited user" do
        let(:user) { create :user }

        context "and user cannot set roles of other user" do
          before :each do
            controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
            get 'roles', {id: other_user.to_param}, valid_session
          end

          it_behaves_like "user is not authorized"
        end

        context "and user can set roles of other user" do
          before :each do
            controller.should_receive(:authorize!).and_return true
            get 'roles', {id: other_user.to_param}, valid_session
          end

          it "sets user to the proper user" do
            expect(assigns(:user)).to eql(other_user)
          end

          it "renders 'roles'" do
            expect(response).to render_template('roles')
          end

          it "sets roles to a proper roles object" do
            expect(assigns(:roles)).to be_a(Roles)
          end
        end
      end
    end
  end

  describe "POST set_roles" do

    let :valid_parameters do
      {
          id: other_user.to_param,
          roles: {
              simple: "0",
              admin: "1",
              god: "1"
          }
      }
    end

    before :each do
      login_user user if user
    end

    let(:other_user) { create :user, :simple }

    context "when user is not logged in" do
      let(:user) { nil }

      before :each do
        post 'set_roles',
            valid_parameters,
            valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do

      context "and user cannot set roles" do

        let(:user) { create :user }

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          post 'set_roles',
               valid_parameters,
               valid_session
        end

        it_behaves_like "user is not authorized"
      end

      context "and user is god" do
        let(:user) { create :user, :god}

        before :each do
          controller.should_receive(:authorize!).and_return true
          post 'set_roles',
               valid_parameters,
               valid_session
        end

        it "sets @user to other_user" do
          expect(assigns(:user)).to eql(other_user)
        end

        it "sets @roles to a roles object" do
          expect(assigns(:roles)).to be_a(Roles)
        end

        it "renders roles" do
          expect(response).to redirect_to(roles_user_path)
        end

        it "sets the proper roles to @roles" do
          assigns(:roles).tap do |r|
            expect(r).to be_admin
            expect(r).to be_god
            expect(r).not_to be_simple
          end
        end

        it "sets a new role to other_user" do
          other_user.reload
          expect(other_user).to be_admin
          expect(other_user).to be_god
          expect(other_user).not_to be_simple
        end

        it "sets the flash" do
          expect(flash[:notice]).to be_present
        end
      end

      context "and user is not god" do
        let(:user) { create :user, :admin}

        before :each do
          controller.should_receive(:authorize!).and_return true
          post 'set_roles',
               valid_parameters,
               valid_session
        end

        it "sets @user to other_user" do
          expect(assigns(:user)).to eql(other_user)
        end

        it "sets @roles to a roles object" do
          expect(assigns(:roles)).to be_a(Roles)
        end

        it "renders roles" do
          expect(response).to redirect_to(roles_user_path)
        end

        it "sets the proper roles to @roles" do
          assigns(:roles).tap do |r|
            expect(r).to be_admin
            expect(r).not_to be_simple
            expect(r).not_to be_god
          end
        end

        it "sets a new role to other_user" do
          other_user.reload
          expect(other_user).to be_admin
          expect(other_user).not_to be_god
          expect(other_user).not_to be_simple
        end

        it "sets the flash" do
          expect(flash[:notice]).to be_present
        end
      end
    end
  end
end
