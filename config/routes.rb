Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :workers
  resources :shifts, only: [:new, :create, :edit, :update]
  resources :calendar, only: :index
  get '/select', to: "pages#select"
end
