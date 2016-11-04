Rails.application.routes.draw do
  resources :items
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get 'login' => 'devise/sessions#new'
  	delete 'signout' => 'devise/sessions#destroy'
  	get 'signup' => 'devise/registrations#new' 
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'services' => 'pages#services'
  get 'projects' => 'pages#projects'
  get 'recognition' => 'pages#recognition'
  get 'contact' => 'pages#contact_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
