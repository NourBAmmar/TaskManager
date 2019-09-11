Rails.application.routes.draw do
  get 'archive/show_archive'
  resources :tasks do
  	member do
  		patch :complete
  	end
  end
  root to:'pages#home'
  resources :recherches
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
