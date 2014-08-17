Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get '/', to: 'welcome#index'
  get 'users/:id' => 'users#show', as: :user

  # resources :exercises
  # resources :workouts
  # resources :workout_histories
  # resources :exercise_histories

  get '/test_api_call', :to => 'exercises#test_api_call'

  shallow do
    resources :users do
      resources :workouts do
      # 'lang/:lang_id/queries',           'lang/:lang_id/queries/new',           'queries/:id',      'queries/:id/edit' =>
      #  language_queries_path(@language), new_language_queries_path(@language),  query_path(@query),  edit_query_path(@query)
        resources :exercises
        # 'queries/:query_id/comments', 'queries/:query_id/comments/new', 'comments/:id',            'comments/:id/edit' =>
        #  query_comments_path(@query),  new_query_comments_path(@query),  comment_path(@comment),   edit_comment_path(@comment)
      end
    end
  end

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
