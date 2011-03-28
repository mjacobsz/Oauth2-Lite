Oauth2Lite20::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'user/login' => 'User#login'
  match 'user/validate' => 'User#validate'
  
  match 'oauth2/authenticate' => 'Oauth2#authenticate'
  match 'oauth2/missing_info' => 'Oauth2#missing_info'
  match 'oauth2/error.html' => 'Oauth2#error'
  match 'oauth2/granted' => 'Oauth2#redirect_uri_test'
  match 'oauth2/password_wise' => 'Oauth2#resource_owner_password_credentials'
  
  match 'token/authenticated' => 'Token#authenticated'
  
  #match 'scaffold/dilla' => 'Scaffold#mami'
  #match 'scaffold/jayz' => 'Scaffold#jayz'
  #match 'scaffold/mobd' => 'Scaffold#mobd'

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
