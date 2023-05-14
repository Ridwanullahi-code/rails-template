Rails.application.routes.draw do

  namespace :admin do
      resources :transactions
      resources :users
      root to: "users#index"
    end

  devise_for :users
  
  # add path
  root 'user#show'

  get 'deposit' => 'user#deposit', :as => 'deposit'
  get 'withdraw' => 'user#withdraw', :as => 'withdraw'
  get 'new_user_referral' => 'user#referral', :as => 'new_user_referral'
end
