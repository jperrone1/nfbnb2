Rails.application.routes.draw do

  resources :accommodations

  root to: 'accommodations#welcome'

  get '/accommodation_search/', to: 'accommodations#search', as: 'search_other'

  get '/accommodation_results/', to: 'accommodations#results', as: 'search_results' 

  devise_for :users 

  get '/about_us', to: 'pages#about_us', as: 'about'
  get '/contact_us', to: 'pages#contact_us', as: 'contact' 

end

# Routes as of 6/25/14 11 AM: 
# Jeffs-MacBook-Pro-2:nfbnb Jeff$ bundle exec rake routes
#                   Prefix Verb   URI Pattern                        Controller#Action
#           accommodations GET    /accommodations(.:format)          accommodations#index
#                          POST   /accommodations(.:format)          accommodations#create
#        new_accommodation GET    /accommodations/new(.:format)      accommodations#new
#       edit_accommodation GET    /accommodations/:id/edit(.:format) accommodations#edit
#            accommodation GET    /accommodations/:id(.:format)      accommodations#show
#                          PATCH  /accommodations/:id(.:format)      accommodations#update
#                          PUT    /accommodations/:id(.:format)      accommodations#update
#                          DELETE /accommodations/:id(.:format)      accommodations#destroy
#                     root GET    /                                  accommodations#welcome
#             search_other GET    /accommodation_search(.:format)    accommodations#search
#           search_results GET    /accommodation_results(.:format)   accommodations#results
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            devise/registrations#cancel
#        user_registration POST   /users(.:format)                   devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise/registrations#edit
#                          PATCH  /users(.:format)                   devise/registrations#update
#                          PUT    /users(.:format)                   devise/registrations#update
#                          DELETE /users(.:format)                   devise/registrations#destroy


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
