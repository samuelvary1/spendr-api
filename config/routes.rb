Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :expenses, except: [:new, :edit]
      resources :categories, except: [:new, :edit]
    end
  end
end
