Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'profiles', to: 'profiles#show'
  get 'transactions', to: 'transactions#index'


  resources :products, only: [:new, :create] do
    resources :ratings, only: [:new, :create]
  end

  resources :offers do
    member do
      patch "/stock_increase", to: "offers#increase"
      patch "/stock_decrease", to: "offers#decrease"
    end

    resources :orders, only: [:show, :create]  do
      resources :payments, only: [:new, :create]
      member do
        patch "/units_increase", to: "orders#increase"
        patch "/units_decrease", to: "orders#decrease"
      end
    end
  end

  patch "orders/:id/rating_update", to: "orders#rating_update",as: :order_rating_update


  resources :shops, only: [:new, :create]
end
