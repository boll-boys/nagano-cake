Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

end
