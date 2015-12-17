Rails.application.routes.draw do

  root to: 'application#angular'
  resources :faculties, only: [:index, :show]
  resources :hostels, only: [:show], defaults: {format: 'json'}
  get 'hostels/showby/:id' => 'hostels#show_by_faculty',  defaults: {format: 'json'}
  get 'hostels/shownotby/:id' => 'hostels#show_not_by_faculty', defaults: {format: 'json'}

  get 'faculties/showby/:id' => 'faculties#show_by_hostels',  defaults: {format: 'json'}
  match 'faculties/delhostel' ,to: 'faculties#destroy_hostel',via: 'post'
  match 'faculties/addhostel' ,to: 'faculties#add_hostel',via: 'post'
  match 'faculties/addstudent', to: 'faculties#add_student',via: 'post',defaults: {format: 'json'}
  match 'studentscount/:id', to: 'hostels#students_count',via: 'get',defaults: {format: 'json'}
  match 'studentsplaced/:id', to: 'hostels#already_placed',via: 'get',defaults: {format: 'json'}

  match 'hostels/addstudent' ,to: 'hostels#add_student',via: 'patch',  defaults: {format: 'json'}

  match 'studentswithout/:id', to: 'students#students_without_benefits',via: 'get', defaults: {format: 'json'}
  match 'studentswith/:id', to: 'students#index',via: 'get', defaults: {format: 'json'}
  match 'hostelavg', to: 'hostels#search_avg',via: 'get', defaults: {format: 'json'}
  match 'hostelcnt', to: 'hostels#search_already',via: 'get', defaults: {format: 'json'}

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
