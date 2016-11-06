Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
    delete 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new' 
  end

  get 'feed', to: 'feed#show'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items
  resources :tweets 
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'projects', to: 'pages#projects'
  get 'recognition', to: 'pages#recognition'
  get 'contact', to: 'pages#contact_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
