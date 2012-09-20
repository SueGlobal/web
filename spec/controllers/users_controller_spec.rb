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
    for_users_that_can :index, :users do |role|
      context "by #{role} user" do
        let(:user) { create "#{role}_user" }
        before :each do
          login_user user
        end

        it "assigns all users as @users" do
          get :index, {}, valid_session
          assigns(:users).should eq([user])
        end
      end
    end

    for_users_that_cannot :index, :users do |role|
      context "by #{role} user" do
        let(:user) { create "#{role}_user" }
        before :each do
          login_user user
          get :index, {}, valid_session
        end

        it "behaves as not authorized" do
          behave_as_unauthorized
        end
      end
    end
  end

  describe "GET show" do
    before :each do
      login_user user
    end

    context "given a simple user" do
      let(:user) { create :simple_user }

      it "can see himself" do
        get :show, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "cannot see anybody else" do
        other_user = create :user
        get :show, {id: other_user.to_param}, valid_session
        behave_as_unauthorized
      end
    end

    context "given an admin user" do
      let(:user) { create :admin_user }

      it "can see himself" do
        get :show, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "can see a simple user" do
        simple_user = create :simple_user
        get :show, {id: simple_user.to_param}, valid_session
        assigns(:user).should eq(simple_user)
      end

      it "can see another admin user" do
        other_user = create :admin_user
        get :show, {id: other_user.to_param}, valid_session
        assigns(:user).should eq(other_user)
      end

      it "cannot see god" do
        god = create :god_user
        get :show, {id: god.to_param}, valid_session
        behave_as_unauthorized
      end
    end

    context "given a god user" do
      let(:user) { create :god_user }

      it "can see himself" do
        get :show, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "can see a simple user" do
        simple_user = create :simple_user
        get :show, {id: simple_user.to_param}, valid_session
        assigns(:user).should eq(simple_user)
      end

      it "can see another admin user" do
        admin_user = create :admin_user
        get :show, {id: admin_user.to_param}, valid_session
        assigns(:user).should eq(admin_user)
      end

      it "can see another god user" do
        other_user = create :god_user
        get :show, {id: other_user.to_param}, valid_session
        assigns(:user).should eq(other_user)
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

    before :each do
      login_user user
    end

    context "given a simple user" do
      let(:user) { create :simple_user }

      it "can edit himself" do
        get :edit, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "cannot edit other user" do
        other_user = create :simple_user
        get :edit, {id: other_user.to_param}, valid_session
        behave_as_unauthorized
      end
    end

    context "given an admin user" do
      let(:user) { create :admin_user }

      it "can edit himself" do
        get :edit, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "can edit simple users" do
        simple_user = create :simple_user
        get :edit, {id: simple_user.to_param}, valid_session
        assigns(:user).should eq(simple_user)
      end

      it "can edit admin users" do
        admin_user = create :admin_user
        get :edit, {id: admin_user.to_param}, valid_session
        assigns(:user).should eq(admin_user)
      end

      it "cannot edit god" do
        god = create :god_user
        get :edit, {id: god.to_param}, valid_session
        behave_as_unauthorized
      end
    end

    context "given a god user" do
      let(:user) { create :god_user }

      it "can edit himself" do
        get :edit, {id: user.to_param}, valid_session
        assigns(:user).should eq(user)
      end

      it "can edit simple users" do
        simple_user = create :simple_user
        get :edit, {id: simple_user.to_param}, valid_session
        assigns(:user).should eq(simple_user)
      end

      it "can edit admin users" do
        admin_user = create :admin_user
        get :edit, {id: admin_user.to_param}, valid_session
        assigns(:user).should eq(admin_user)
      end

      it "can edit god" do
        god = create :god_user
        get :edit, {id: god.to_param}, valid_session
        assigns(:user).should eq(god)
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

      it "does not send any email" do
        lambda{
          post :create, {user: {}}, valid_session
        }.should_not change{ number_of_emails }
      end
    end
  end

  describe "PUT update" do
    before :each do
      login_user user
    end

    describe "with valid params" do

      context "given a simple user" do
        let(:user) { create :simple_user }

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

        context "when editting himself" do

          it "cannot modify its email" do
           put :update, {id: user.to_param, user: {'email' => 'other_email@example.com'}}, valid_session
            user.reload.email.should_not eq('other_email@example.com')
          end
        end

        context "when editting an admin user" do
          let(:admin_user) { create :admin_user }

          it "is not authorized" do
            put :update, {id: admin_user.to_param, user: {}}, valid_session
            behave_as_unauthorized
          end
        end

        context "when editting a god" do
          let(:god) { create :god_user }

          it "is not authorized" do
            put :update, {id: god.to_param, user: {}}, valid_session
            behave_as_unauthorized
          end
        end
      end

      context "given an admin user" do
        let(:user) { create :admin_user }

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

        context "when editting himself" do

          it "cannot modify its email" do
           put :update, {id: user.to_param, user: {'email' => 'other_email@example.com'}}, valid_session
            user.reload.email.should_not eq('other_email@example.com')
          end
        end

        context "when editting a simple user" do
          let(:simple_user) { create :simple_user }

          it "is not authorized" do
            put :update, {id: simple_user.to_param, user: {}}, valid_session
            assigns(:user).should eq(simple_user)
          end
        end

        context "when editting an admin user" do
          let(:admin_user) { create :admin_user }

          it "is not authorized" do
            put :update, {id: admin_user.to_param, user: {}}, valid_session
            assigns(:user).should eq(admin_user)
          end
        end

        context "when editting a god" do
          let(:god) { create :god_user }

          it "is not authorized" do
            put :update, {id: god.to_param, user: {}}, valid_session
            behave_as_unauthorized
          end
        end
      end

      context "given an god user" do
        let(:user) { create :god_user }

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

        context "when editting himself" do

          it "cannot modify its email" do
           put :update, {id: user.to_param, user: {'email' => 'other_email@example.com'}}, valid_session
            user.reload.email.should eq('other_email@example.com')
          end
        end

        context "when editting a simple user" do
          let(:simple_user) { create :simple_user }

          it "is not authorized" do
            put :update, {id: simple_user.to_param, user: {}}, valid_session
            assigns(:user).should eq(simple_user)
          end
        end

        context "when editting an admin user" do
          let(:admin_user) { create :admin_user }

          it "is not authorized" do
            put :update, {id: admin_user.to_param, user: {}}, valid_session
            assigns(:user).should eq(admin_user)
          end
        end

        context "when editting a god" do
          let(:god) { create :god_user }

          it "is not authorized" do
            other_god = create :god_user
            put :update, {id: god.to_param, user: {}}, valid_session
            assigns(:user).should eq(god)
          end
        end
      end
    end

    describe "with invalid params" do
      let(:user) { create :user }

      it "assigns the user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {id: user.to_param, user: {}}, valid_session
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {id: user.to_param, user: {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      login_user user
    end

    for_users_that_can :destroy, User do |role|
      context "when user is #{role}" do
        let(:user) { create "#{role}_user" }

        it "destroys the requested user" do
          other_user = User.create! valid_attributes
          expect {
            delete :destroy, {id: other_user.to_param}, valid_session
          }.to change(User, :count).by(-1)
        end

        it "redirects to root" do
          other_user = User.create! valid_attributes
          delete :destroy, {id: other_user.to_param}, valid_session
          response.should redirect_to(root_path)
        end
      end
    end

    for_users_that_cannot :destroy, User do |role|
      context "when user is #{role}" do
        let(:user) { create "#{role}_user" }

        before :each do
          other_user = create :user
          lambda{
            delete :destroy, {id: other_user.to_param}, valid_session
          }.should_not change(User, :count)
        end

        it "behaves as unauthorized" do
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
