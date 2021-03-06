Rails.application.routes.draw do
  resources :locations, only: [:index, :create]
  resources :devices
  devise_for :users

  resources :users do
    member do
      get :edit_profile
      patch :update_profile
    end
  end

  root to: redirect('/users/sign_in')
end
