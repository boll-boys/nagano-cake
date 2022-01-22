Rails.application.routes.draw do

  
  devise_for :admin,skip: [:registrations,:passwords,], controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}

  devise_for :customers,skip: [:passwords] ,controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
  }
  
  get '/about' => 'homes#about'
  root to: 'homes#top'
  
  
  namespace :admin do
    resources :customers
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  scope module: :customers do
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :create, :update]
  end
  scope module: :customers do
  resources :addresses, except: [:show, :new]
  end





end
