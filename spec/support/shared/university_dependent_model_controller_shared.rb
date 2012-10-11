shared_examples "a university dependent model controller" do |model, *actions|

  def valid_attributes
    attributes_for model_name
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:resource) { create model_name }
  let(:university) { resource.university }

  let(:other_resource) { create model_name }
  let(:other_university) { other_resource.university }

  let(:model_name) { model.name.underscore.to_sym }
  let(:models) { model_name.to_s.pluralize.to_sym }

  if actions.include? :index
    describe "GET index" do
      let(:user) { nil }

      before :each do
        other_resource
        get :index, {university_id: university.to_param}, valid_session
      end

      it "assign all resources as an instance variable" do
        assigns(models).should eq([resource])
        assigns(models).should_not include(other_resource)
      end

      it_behaves_like "university is decorated"
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

      it_behaves_like "university is decorated"
    end
  end

  if actions.include? :new
    describe "GET new" do

      context "when there is no user logged in" do
        let(:user) { nil }

        before :each do
          get :new, {university_id: university.to_param}, valid_session
        end

        it_behaves_like "user is not authenticated"
      end

      context "when there is a user logged in" do
        let(:user) { create :user }

        context "and can 'new' the resource" do

          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_return true
            get :new, {university_id: university.to_param}, valid_session
          end

          it "assigns a new resource as an instance variable" do
            assigns(model_name).should be_a_new(model)
          end

          it "assigns university_id to university.id in the new resource" do
            assigns(model_name).university_id.should eq(university.id)
          end

          it "renders new template" do
            response.should render_template('new')
          end

          it "assigns a proper path for the form" do
            assigns(:path).should eq([university, assigns(model_name)])
          end

          it_behaves_like "university is decorated"
        end

        context "and cannot 'new' the resource" do

          before :each do
            controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
            get :new, {university_id: university.to_param}, valid_session
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

          it "assigns a proper path for the form" do
            assigns(:path).should eq(resource)
          end

          it_behaves_like "university is decorated"
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
          { university_id: university.to_param,
            model_name => valid_attributes},
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
              university
              expect {
                post_create
              }.to change(model, :count).by(1)
            end

            it "assigns a newly created resources as an instance_variable" do
              post_create
              assigns(model_name).should be_a(model)
              assigns(model_name).should be_persisted
            end

            it "redirects to the created resource" do
              post_create
              response.should redirect_to(model.last)
            end

            it "sets the flash" do
              post_create
              should set_the_flash
            end

            it_behaves_like "university is decorated" do
              before :each do
                post_create
              end
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

            it "assigns a proper path for the form" do
              post_create
              assigns(:path).should eq([university, assigns(model_name)])
            end

            it_behaves_like "university is decorated" do
              before :each do
                post_create
              end
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

            it "redirects to the resource" do
              put_update
              response.should redirect_to(resource)
            end

            it "sets a flash" do
              put_update
              should set_the_flash
            end

            it_behaves_like "university is decorated" do
              before :each do
                put_update
              end
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

            it "assigns a proper path for the form for" do
              assigns(:path).should eq(resource)
            end

            it_behaves_like "university is decorated"
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

          it "redirects to the university" do
            delete_destroy
            response.should redirect_to(university)
          end

          it "sets the flash" do
            delete_destroy
            should set_the_flash
          end

          it_behaves_like "university is decorated" do
            before :each do
              delete_destroy
            end
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
