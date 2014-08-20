Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get '/', to: 'welcome#index'

  shallow do
    resources :users do
      resources :workouts do
        resources :exercises do
          resources :exercise_histories
        end
      end
    end
  end

get '/timer' => 'timers#show'

end
