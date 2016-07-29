Rails.application.routes.draw do
  resources :order_items
  resources :products
  resources :addresses
  resources :users
  resources :products
  resource :cart

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'static_pages/home'
  get 'static_pages/help'

  get '' => 'static_pages#home', as: 'home'
  get 'help' => "static_pages#help"
  get 'about' => "static_pages#about"

  get '/signup', to: "addresses#new"
  post '/signup', to: "addresses#create"

  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  post '/checkout/login', to: 'sessions#checkout_login', as: 'checkout_login'

  get '/logout',  to: 'sessions#destroy', as: 'logout'

  get '/shop', to: 'products#index', as: 'shop'

  get '/cart', to: 'carts#index'

  get '/checkout', to: 'carts#checkout', as: 'checkout'

  get '/checkout/address', to: 'carts#address', as: 'shipping'
  post '/checkout/address', to: 'carts#checkout_address', as: 'checkout_address'

  get '/checkout/confirmation', to: 'carts#confirmation', as: 'confirmation'

  patch '/checkout/confirmation', to: 'carts#confirm', as: 'confirm'

  get '/checkout/confirmation/edit', to: 'addresses#edit', as: 'address_edit'





  get '/admin/products/new', to: 'admin_sessions#new_product'

  get '/admin', to: 'admin_sessions#new'
  post '/admin', to: 'admin_sessions#create'

  get '/admin/users', to: 'admin_sessions#users', as: 'admin_users'
  get '/admin/orders', to: 'admin_sessions#orders', as: 'admin_orders'
  get '/admin/products', to: 'admin_sessions#products', as: 'admin_products'



  get '/admin/orders/:id', to:  'admin_sessions#order', as: 'admin_order'
  get '/admin/products/:id', to: 'admin_sessions#product', as: 'admin_product'

  get '/admin/products/:id/edit', to: 'admin_sessions#edit_product', as: 'admin_edit_product'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
