Rails.application.routes.draw do

  resources :wards
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

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end

  resources :tweets 
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'services', to: 'pages#services'
  get 'projects', to: 'pages#projects'
  get 'recognition', to: 'pages#recognition'
  get 'contact', to: 'pages#contact_us'

  get '*path' => redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
