Rails.application.routes.draw do
  resources :users, except: [:new, :edit]
  resources :expenses, except: [:new, :edit]
  resources :categories, except: [:new, :edit]
  resources :users

end
