Rails.application.routes.draw do
  resources :users
  resources :expenses, except: [:new, :edit]
  resources :categories, except: [:new, :edit]

end
