Rails.application.routes.draw do

  get '/about' => 'homes#about'
  root to: 'homes#top'

  devise_for :admins
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  scope module: :customers do
  resources :items, only: [:index, :show]
  end




end
