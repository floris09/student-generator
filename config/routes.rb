Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :update]
  resources :admins, only: [:index]
  resources :daypairs, only: [:update]


  get     "/showpair"  => "admins#showpair", as: :show_pair

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
