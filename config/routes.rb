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
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders,only: [:index, :show]
  end
  scope module: :customers do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete '/cart_items' => 'cart_items#destroy_all', as: :destroy_all_cart_items
    resources :addresses, except: [:show, :new]
  end





end
