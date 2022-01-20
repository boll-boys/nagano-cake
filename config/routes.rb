Rails.application.routes.draw do


  devise_for :admins
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end



end
