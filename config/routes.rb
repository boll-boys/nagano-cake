Rails.application.routes.draw do
  get "/about" => "homes#about" 
  root to: 'homes#top'
  devise_for :admin,skip: [:registrations, :passwords]  ,controllers: {
  sessions: 'adomin/sessions'
  }
  
  devise_for :customers,skip: [:passwords,] ,controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end



end
