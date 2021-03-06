Coffeenated::Application.routes.draw do
  resources :rankings

  resources :roasters

  resources :coffee_types

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end