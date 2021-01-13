Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # rails routes --expanded
  root "pages#home"
  get "/about", to: "pages#about"
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update]
  resources :articles
  get "singup", to: "users#new"
  #post "users", to: "users#create"
  resources :users, except: [:new]
end
