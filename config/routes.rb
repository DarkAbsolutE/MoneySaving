Rails.application.routes.draw do
    put 'update_status/:id', to: 'employees#update_status', as:'update_status'
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    resources :employees, except: [:create, :new]
    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
    resources :employees
    resources :salaries, only: [:update, :edit]
    root to: "homes#login"
end
