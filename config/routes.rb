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
     resources :customers, onry: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  scope module: :customers do
  resources :customers, only: [:edit, :update]
  get "customers/my_page" => "customers#show", as: "my_page"
  resources :items, only: [:index, :show]
  get   "/customers/:id/quit" => "customers#quit"
  patch "customers/:id/out" => "customers#out", as: "out"
  end




end
