Rails.application.routes.draw do
  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back' => 'reservations#back'
    end
  end

  resources :rooms do
    collection do
      get 'own'
    end
  end

  devise_for :users
  get 'users/account' => 'users#account'
  get 'users/profile' => 'users#profile'

  root 'top#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
