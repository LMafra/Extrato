Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get "/perfomance_evaluation/:role_id" => "static_pages#perfomance_evaluation"
  get "/perfomance_result" => "static_pages#perfomance_result"
  get "/perfomance_areas" => "static_pages#perfomance_areas"
  get "/home" => "static_pages#home"
  get "/ajax_perfomance_user_save" => "static_pages#ajax_perfomance_user_save"


  get "/perfomance_answer" => "static_pages#perfomance_answer"
  devise_for :users, :controllers => { registrations: 'devise/registrations' }
  resources :questions
  resources :dimensions
  resources :perfomances
  resources :roles
  resources :areas
  resources :organograms
  resources :junior_companies
  resources :federations
  resources :cities
  resources :states
  resources :countries
  resources :roles

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
