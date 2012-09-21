require 'spec_helper'

describe PasswordResetsController do


  let!(:user) { create :user, :active }

  describe "POST 'create'" do
    context "when user is active" do
      it "redirects to login" do
        post 'create', {email: user.email}, {}
        response.should redirect_to(login_path)
      end

      it "sents an email" do
        lambda{
          post 'create', {email: user.email}, {}
        }.should change{ number_of_emails }.by(1)
      end

      it "sets a notice" do
        post 'create', {email: user.email}, {}
        flash.notice.should_not be_blank
      end

      it "sets a reset_password_token in user" do
        post 'create', {email: user.email}, {}
        user.reload.reset_password_token.should_not be_nil
      end
    end

    context "when user is not active" do

      let(:user) { create :user, :inactive }

      it "redirects to login" do
        post 'create', {email: user.email}, {}
        response.should redirect_to(login_path)
      end

      it "sends a email" do
        lambda{
          post 'create', {email: user.email}, {}
        }.should change{ number_of_emails }.by(1)
      end

      it "sets a notice" do
        post 'create', {email: user.email}, {}
        flash.notice.should_not be_blank
      end

      it "does not set a reset_password_token in user" do
        post 'create', {email: user.email}, {}
        user.reload.reset_password_token.should be_nil
      end
    end

    context "when user does not exist" do

      it "redirects to login" do
        post 'create', {email: 'not_even_an_email'}, {}
        response.should redirect_to(login_path)
      end

      it "sets a notice" do
        post 'create', {email: 'not_even_an_email'}, {}
        flash.notice.should_not be_blank
      end

      it "does not send an email" do
        lambda{
          post 'create', {email: 'not_even_an_email'}, {}
        }.should_not change{ number_of_emails }
      end

      it "does not set a reset_password_token in user" do
        post 'create', {email: 'not_even_an_email'}, {}
        user.reload.reset_password_token.should be_nil
      end
    end
  end

  describe "GET 'edit'" do
    let(:user) { create :user, :active, :reset_password }

    it "returns http success" do
      get 'edit', {id: user.reset_password_token}, {}
      response.should be_success
    end

    it "assigns user to @user" do
      get 'edit', {id: user.reset_password_token}, {}
      assigns(:user).should eq(user)
    end

    it "assigns params[:id] to @token" do
      get 'edit', {id: user.reset_password_token}, {}
      assigns(:token).should eq(user.reset_password_token)
    end

    context "if there is no such user" do

      it "behaves as not authenticated" do
        get 'edit', {id: "p#{user.reset_password_token}"}, {}
        behave_as_not_authenticated
      end
    end
  end

  describe "PUT 'update'" do
    let(:user) { create :user, :active, :reset_password }
    let(:new_password) { 'some_cool_new_password' }

    context "with valid token and parameters" do
      let (:parameters) do
        { token: user.reset_password_token,
          id: user.reset_password_token,
          user: { password: new_password,
                  password_confirmation: new_password} }
      end

      it "redirects to login" do
        put 'update', parameters, {}
        response.should redirect_to(login_path)
      end

      it "sets a notice" do
        put 'update', parameters, {}
        flash.notice.should_not be_blank
      end

      it "changes the password" do
        lambda{
          put 'update', parameters, {}
        }.should change { user.reload.crypted_password }
      end

      it "assigns user to @user" do
        put 'update', parameters, {}
        assigns(:user).should eq(user)
      end

      it "assigns params[:token] to @token" do
        put 'update', parameters, {}
        assigns(:token).should eq(user.reset_password_token)
      end
    end

    context "with invalid token" do

      let (:parameters) do
        { token: "p#{user.reset_password_token}",
          id: user.reset_password_token,
          user: { password: new_password,
                  password_confirmation: new_password} }
      end

      it "behaves as not authenticated" do
        put 'update', parameters, {}
        behave_as_not_authenticated
      end
    end

    context "when params[:token] and params[:id] are not equal" do

      let (:parameters) do
        { token: user.reset_password_token,
          id: "p#{user.reset_password_token}",
          user: { password: new_password,
                  password_confirmation: new_password} }
      end

      it "behaves as not authenticated" do
        put 'update', parameters, {}
        behave_as_not_authenticated
      end
    end

    context "when passwords are invalid" do

      let (:parameters) do
        { token: user.reset_password_token,
          id: user.reset_password_token,
          user: { password: new_password,
                  password_confirmation: "p#{new_password}" } }
      end

      it "renders action edit" do
        put 'update', parameters, {}
        response.should render_template('edit')
      end
    end
  end

end
