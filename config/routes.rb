Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "users/me", to: "users#me"
      resources :users
      resources :expenses, except: [:new, :edit]
      # current_user
      resources :categories, except: [:new, :edit]
    end
  end

  post "/users/sign_in", to: "sessions#create"
end
