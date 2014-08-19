Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get '/', to: 'welcome#index'
  get 'users/:id' => 'users#show', as: :user

 get '/exercises' => 'exercises#index'

  shallow do
    resources :users do
      resources :workouts do
        resources :exercises do
          resources :exercise_histories
        end
      end
    end
  end


end
