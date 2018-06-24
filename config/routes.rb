Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :workers, only: [:new, :create, :edit, :update]
  resources :shifts, only: [:new, :create]
  get '/calendar', to: "pages#calendar"
end
