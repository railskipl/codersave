DemoCloud::Application.routes.draw do 
 
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

 resources :authentications
 
 resources :courses
 
 # Match the Omniauth provider Callback.
 match '/auth/:provider/callback' => 'authentications#create' 
 match '/users/validations/check_email', :to=>"users#check_email"
 
 get "password_resets/new"

 match '/change_password', :controller => 'users', :action => 'change_password'
 
 # resources :users
 
 resources :users do
    get "is_authenticated", :on=> :member
 end
  
  resources :sessions, :only => [:new,:create,:destroy,:edit]
  
  root :to => 'homes#index'
  
  match 'dashboard' => 'users#dashboard', :as => 'user_root'
  match '/signup', :to =>'users#new'
  match '/signin', :to =>'sessions#new'
  match  '/users/:id/edit',  :to => "users#edit" 
  match '/signout', :to =>'sessions#destroy'
  
  resources :password_resets
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
