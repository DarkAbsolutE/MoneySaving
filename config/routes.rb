Rails.application.routes.draw do
  put 'update_status/:id', to: 'employees#update_status', as:'update_status'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :employees, except: [:new, :create, :destroy]
  resources :sessions, only: [:create, :destroy]
  resources :homes, only: [:index]
  resources :salaries, only: [:update]
  root to: "homes#login"
end
