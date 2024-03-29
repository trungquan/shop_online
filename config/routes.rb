ShopOnline::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy, :add_to_cart, 
                :my_cart, :remove_from_cart, :emty_cart] 
  resources :users
  resources :categories
  resources :products do
    member do
      get :find_category
    end
  end
  resources :orders
  resources :items

  root to: 'static_pages#home'
  
  match '/signup', to: 'users#new'
  match '/help', to: 'static_pages#help' 

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/allproducts', to: 'products#index'
  match '/add_to_cart/:product_id', as: 'add_to_cart', to: 'sessions#add_to_cart', via: :post
  match '/remove_from_cart/:product_id', as: "remove_from_cart", 
                            to: 'sessions#remove_from_cart', via: :get
  match '/my_cart', to: 'sessions#my_cart'
  match '/emty_cart', to: 'sessions#emty_cart'

  match '/submit', to: 'orders#create', via: :post
  match '/create_items', to: 'items#create', via: :get
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
