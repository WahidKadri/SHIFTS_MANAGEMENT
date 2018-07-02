Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :workers, only: [:index, :show, :new, :create, :edit, :update]
  resources :shifts, only: [:index, :new, :create, :edit, :update]
  resources :calendar, only: :index
end
