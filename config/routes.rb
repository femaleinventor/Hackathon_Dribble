Rails.application.routes.draw do

  resources :sports do
    resources :leagues
  end

  resources :leagues do
    resources :matches
  end

  resources :predictions

  resources :tweets

  devise_for :users

  get 'shop/index'

  

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
