require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    before :each do
      get 'new'
    end

    it "returns http success" do
      response.should be_success
    end

    it 'sets a new user' do
      assigns(:user).should be_a(User)
    end

    it 'renders new view and form partial' do
      response.should render_template('new')
    end
  end

  describe "POST 'create'" do
    let(:password) { 'some_cool_password' }
    let!(:user) { create :user, :active, password: password }

    context "with valid access data" do
      let(:attrs) { {email: user.email, password: password, remember_me: true} }

      before :each do
        post 'create', attrs
      end

      it "redirects to root when no back url is found" do
        response.should redirect_to(root_path)
      end
    end

    context "with invalid access data" do
      let(:attrs) { {email: user.email, password: "p" + password} }
      before :each do
        post 'create', attrs
      end

      it "renders new" do
        response.should render_template('new')
      end

      it 'shows an alert' do
        flash[:alert].should_not be_blank
      end
    end
  end

  describe "GET 'logout'" do
    let!(:user) { create :user }

    before :each do
      login_user user
      get 'destroy'
    end

    it "redirects to root" do
      response.should redirect_to(root_path)
    end

    it "shows a notice" do
      flash.notice.should_not be_blank
    end
  end
end
