require 'spec_helper'

describe UniversityUsersController do

  def valid_session
    {}
  end

  describe "GET 'index'" do
    let(:university) { create :university }
    let(:university_user) { create :user, university: university }
    before :each do
      login_user user if user
    end

    context "when no user is logged in" do
      let(:user) { nil }

      before :each do
        get :index, {university_id: university.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "and user can remove users" do

        before :each do
          university_user
          controller.should_receive(:authorize!).and_return true
          get :index, {university_id: university.to_param}, valid_session
        end

        it "sets university" do
          expect(assigns(:university)).to eql(university)
        end

        it "sets a list of users" do
          expect(assigns(:users)).to eql([university_user])
        end

        it "renders index template" do
          expect(response).to render_template('index')
        end
      end

      context "and user cannot remove users" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :index, {university_id: university.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end

  end

  describe "GET 'destroy'" do
    let(:university) { create :university }
    let(:university_user) { create :user, university: university }

    def params param_user=nil
      param_user ||= university_user
      {
          university_id: university.to_param,
          id: param_user.to_param
      }
    end

    before :each do
      login_user user if user
    end

    context "when no user is logged in" do
      let(:user) { nil }

      before :each do
        delete :destroy, params, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user, university: university }

      context "and cannot remove users from university" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          delete :destroy, params, valid_session
        end

        it_behaves_like "user is not authorized"
      end

      context "and can remove users from university" do

        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        context "and removed user is the same as logged user" do
          before :each do
            delete :destroy, params(user), valid_session
          end

          it "redirects to list of users" do
            expect(response).to redirect_to(university_users_path(university))
          end

          it "sets an alert" do
            expect(flash[:alert]).to be_present
          end

          it "does not remove user from university" do
            expect(user.reload.university).not_to be_nil
          end
        end

        context "and removed user is not the same as logged user" do

          before :each do
            UniversityChangeRequest.should_receive(:remove_user)
            delete :destroy, params, valid_session
          end

          it "redirects to university users list" do
            expect(response).to redirect_to(university_users_path(university))
          end

          it "sets a notice" do
            expect(flash[:notice]).to be_present
          end
        end
      end
    end
  end

end
