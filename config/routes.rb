Rails.application.routes.draw do
  resources :expenses, except: [:new, :edit]
  resources :categories, except: [:new, :edit]
  resources :users

end
