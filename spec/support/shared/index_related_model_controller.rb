# -*- encoding : utf-8 -*-
shared_examples "an index related model controller" do |model, *actions|

  def valid_attributes
    attributes_for(model_name).tap do |attrs|
      attrs.delete(:slug)
    end
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:resource) { create model_name }

  let(:model_name) { model.name.underscore.to_sym }
  let(:models) { model_name.to_s.pluralize.to_sym }
  let(:model_class) { model }

  if actions.include? :index
    describe "GET index" do
      let(:user) { nil }

      before :each do
        resource
        get :index, {}, valid_session
      end

      it "assign all resources as an instance variable" do
        expect(assigns(models)).to eq([resource])
      end
    end
  end

  if actions.include? :show
    describe "GET show" do
      let(:user) { nil }

      before :each do
        get :show, {id: resource.to_param}, valid_session
      end

      it "assigns the requested resource as an instance variable" do
        assigns(model_name).should eq(resource)
      end

      it "renders show template" do
        expect(response).to render_template('show')
      end
    end
  end

  if actions.include? :new
    describe "GET new" do

      context "when there is no user logged in" do
        let(:user) { nil }

        before :each do
          get :new, {}, valid_session
        end

        it_behaves_like "user is not authenticated"
      end

      context "when there is a user logged in" do
        let(:user) { create :user }

        context "and can 'new' the resource" do

          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
            get :new, {}, valid_session
          end

          it "assigns a new resource as an instance variable" do
            assigns(model_name).should be_a_new(model)
          end

          it "renders new template" do
            response.should render_template('new')
          end
        end

        context "and cannot 'new' the resource" do

          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
            get :new, {}, valid_session
          end

          it_behaves_like "user is not authorized"
        end
      end
    end
  end

  if actions.include? :edit
    describe "GET edit" do
      context "when there is no user logged in" do
        let(:user) { nil }

        before :each do
          get :edit, {id: resource.to_param}, valid_session
        end

        it_behaves_like "user is not authenticated"
      end

      context "when there is a user logged in" do
        let(:user) { create :user }

        context "and it can 'edit' the resource" do
          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
            get :edit, {id: resource.to_param}, valid_session
          end

          it "assigns the requested resource as an instance variable" do
            assigns(model_name).should eq(resource)
          end

          it "renders edit template" do
            response.should render_template('edit')
          end
        end

        context "and it cannot 'edit' the resource" do
          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
            get :edit, {id: resource.to_param}, valid_session
          end

          it_behaves_like "user is not authorized"
        end
      end
    end
  end

  if actions.include? :create

    describe "POST create" do
      def post_create
        post  :create,
              { model_name => valid_attributes},
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

        context "when user can 'create' resources" do

          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
          end

          describe "with valid params" do
            it "creates a resource" do
              expect {
                post_create
              }.to change(model, :count).by(1)
            end

            it "assigns a newly created resources as an instance_variable" do
              post_create
              assigns(model_name).should be_a(model)
              assigns(model_name).should be_persisted
            end

            if actions.include?(:show) || actions.include?(:create_with_show)
              it "redirects to the created resource" do
                post_create
                response.should redirect_to(model.last)
              end
            else
              it "redirects to root" do
                post_create
                expect(response).to redirect_to(root_path)
              end
            end

            it "sets the flash" do
              post_create
              should set_the_flash
            end
          end

          describe "with invalid params" do
            before :each do
              model.any_instance.stub(:save).and_return(false)
            end

            it "assigns a newly created but unsaved resource as an instance variable" do
              post_create
              assigns(model_name).should be_a_new(model)
            end

            it "re-renders the 'new' template" do
              post_create
              response.should render_template('new')
            end
          end
        end

        context "and cannot 'create' the resource" do
          before :each do
            controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
            post_create
          end

          it_behaves_like "user is not authorized"
        end
      end
    end
  end

  if actions.include? :update
    describe "PUT update" do

      def put_update attrs=nil
        attrs ||= valid_attributes
        put :update,
            {id: resource.to_param,
             model_name => attrs},
            valid_session
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

        context "and can 'update' the resource" do
          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
          end

          describe "with valid params" do
            it "updates the requested resource" do
              model.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
              put_update 'these' => 'params'
            end

            it "assigns the requested resource as an instance variable" do
              put_update
              assigns(model_name).should eq(resource)
            end

            if actions.include? :show
              it "redirects to the created resource" do
                put_update
                response.should redirect_to(resource)
              end
            else
              it "redirects to the root" do
                put_update
                expect(response).to redirect_to(root_path)
              end
            end

            it "sets a flash" do
              put_update
              should set_the_flash
            end
          end

          describe "with invalid params" do
            before :each do
              resource
              model.any_instance.stub(:save).and_return(false)
              put_update({})
            end

            it "assigns the resource as an instance variable" do
              assigns(model_name).should eq(resource)
            end

            it "re-renders the 'edit' template" do
              response.should render_template('edit')
            end
          end
        end

        context "and it cannot 'update' the resource" do
          before :each do
            controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
            put_update
          end

          it_behaves_like "user is not authorized"
        end
      end
    end
  end

  if actions.include? :destroy
    describe "DELETE destroy" do
      def delete_destroy id=nil
        id ||= resource.to_param
        delete :destroy,{id: id}, valid_session
      end

      context "when there is no user is logged in" do
        let(:user) { nil }

        before :each do
          delete_destroy
        end

        it_behaves_like "user is not authenticated"
      end

      context "when there is a user logged in" do
        let(:user) { create :user }

        context "and can 'destroy' the general frame" do
          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
            resource
          end

          it "destroys the requested resource" do
            expect{
              delete_destroy
            }.to change(model, :count).by(-1)
          end

          it "redirects to the model" do
            delete_destroy
            expect(response).to redirect_to(models)
          end

          it "sets the flash" do
            delete_destroy
            should set_the_flash
          end
        end

        context "and cannot 'destroy' the resource" do
          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
            resource
          end

          it "does not destroy the requested resource" do
            expect {
              delete_destroy
            }.not_to change(model, :count)
          end

          it_behaves_like "user is not authorized" do
            before :each do
              delete_destroy
            end
          end
        end
      end
    end
  end
end
