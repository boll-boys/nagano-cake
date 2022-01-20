Rails.application.routes.draw do

  get 'homes/top'
  devise_for :admin,skip: [:registrations, :passwords]  ,controllers: {
  sessions: 'adomin/sessions'
  }

  devise_for :customers,skip: [:passwords,] ,controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
