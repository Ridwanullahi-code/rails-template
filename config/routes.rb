Rails.application.routes.draw do

  namespace :admin do
      resources :transactions
      resources :users
      root to: "users#index"
    end

  devise_for :users
  root 'pages#home'

end
