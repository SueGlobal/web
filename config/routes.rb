# -*- encoding : utf-8 -*-
SueGlobal::Application.routes.draw do
  filter :locale, :pagination

  get 'index/confirm/:slug', to: 'index_confirmation#confirm', as: :index_confirm
  get 'index/reject/:slug', to: 'index_confirmation#reject', as: :index_reject
  get "annual_report/(:year)", to: 'annual_report#index', as: :annual_resume

  get "summary/(:year)", to: 'summary#index', as: :summary

  # Documents
  resources :journals
  resources :annual_reports

  # HighVoltage
  get "/pages/:id" => "pages#show", as: :page, format: false
  get "accept_change_request/:token", to: "university_change_request#accept", as: "accept_change_request"

  resources :announcements

  # Index related routes
  resources :sources
  resources :indices do
    resources :samples, shallow: true
  end
  resources :segmentation_variables, except: [:destroy] do
    resources :segments, only: [:new, :create]
  end

  # User related routes
  resources :password_resets, only: [:create, :update, :edit]
  resources :user_sessions

  match 'login' => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout

  get 'signup' => 'users#new', as: 'signup'
  resources :users do
    member do
      get :activate, as: :activate
      get :roles, as: :roles, to: 'users#roles'
      post :roles, as: :roles, to: 'users#set_roles'
    end
  end

  get 'studies/:type', to: 'studies#show', as: 'studies_by_type'
  get 'studies/:type/annual_report/(:year)', to: 'annual_report#show', as: 'studies_annual_report'
  get 'activities/search', to: 'activities#search', as: 'activities_search'
  post 'activities/search', to: 'activities#retrieve', as: 'activities_search'
  # Universities related stuff
  resources :universities do
    resources :services, shallow: true, except: :show
    resources :achieved_activities, shallow: true
    resources :general_frames, shallow: true do
      collection do
         get 'evolution', as: :general_frame_evolution
      end
    end

    #studies
    resources :student_studies, shallow: true
    resources :employer_studies, shallow: true
    resources :public_source_studies, shallow: true
    resources :agreement_source_studies, shallow: true
    resources :database_studies, shallow: true
    resources :other_studies, shallow: true

    member do
      get 'add_user'
      post 'add_user', action: 'do_add_user'
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root to: 'pages#show', id: 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
