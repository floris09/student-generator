Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :admins
  resources :daypairs


  get     "/showpair"  => "admins#showpair", as: :show_pair

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
