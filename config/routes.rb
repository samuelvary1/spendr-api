Rails.application.routes.draw do
devise_for :users, controllers: { sessions: 'sessions' }

  namespace :api do
    namespace :v1 do
      resources :users
      resources :expenses, except: [:new, :edit]
      resources :categories, except: [:new, :edit]
      get "users/me", to: "users#me"
      post "/users/sign_in", to: "sessions#create"
    end
  end

end
