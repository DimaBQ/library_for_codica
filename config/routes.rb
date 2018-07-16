Rails.application.routes.draw do

  devise_for :users
  root 'books#index'
  resources :books       #, only: [:index, :show]
  resources :categories
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  #namespace :admin do
    # resources :books, except: [:index, :show]
  #end

end
