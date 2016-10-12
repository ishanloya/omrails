Rails.application.routes.draw do
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'services' => 'pages#services'
  get 'projects' => 'pages#projects'
  get 'recognition' => 'pages#recognition'
  get 'contact' => 'pages#contact_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
