 VoterLogAnalytics::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  resource :user
  resource :user do
    match "/:id(.:format)" => 'user#destroy'
  end

  root :to => "pages#home"

  resource :page, only: [], path: '' do
    member do
      get :home
      get :front
      get :help
      get :about
      get :security
      get :feedback
    end
  end

  resource :analytic_report
  match "/analytic_reports/index" => 'analytic_reports#index'
  match "/analytic_reports/reset" => 'analytic_reports#reset'
  match "/analytic_reports/analytic" => 'analytic_reports#analytic'

  resource :voter, only: [], path: '' do
    member do
      post :voter
      get :voter
    end
  end

  resource :uplift, only: [], path: '' do
    member do
      post :uplift
    end
  end

  resources :voter_records

  resources :voter_transaction_records do
    match "/:id(.:format)" => 'voter_transaction_records#index'
    match "/*path/:id(.:format)" => 'voter_transaction_records#index'
  end

  resources :voter_transaction_logs do
    match "/:id(.:format)" => 'voter_transaction_logs#index'
    match "/*path/:id(.:format)" => 'voter_transaction_logs#index'
    post "" => 'voter_transaction_logs#replace'
  end

  resources :elections do
    match "/:id(.:format)" => 'elections#index'
    match "/*path/:id(.:format)" => 'elections#index'
    post "" => 'elections#archive'
  end

  match "/elections/replace" => 'elections#replace'

  resources :voters do
    match "/:id(.:format)" => 'voters#index'
    match "/*path/:id(.:format)" => 'voters#index'
  end

  # resource :election, only: [], path: '' do
  #   member do
  #     get :index
  #     get :edit
  #     get :show
  #     get :new
  #   end
  # end

  # resource :voter_transaction_record, only: [], path: '' do
  #   member do
  #     get :index
  #     get :edit
  #     get :show
  #     get :disp
  #     get :new
  #   end
  # end

  # resource :voter_transaction_records, only: [], path: '' do
  #   member do
  #     get :index
  #     get :edit
  #     get :show
  #     get :disp
  #     get :new
  #   end
  # end

  # resource :voter_transaction_record, only:  [ :new, :create, :disp, :show ]

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
