Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contents, only: [:create]
    end
  end

  resources :users, only: :none do
    collection do
      get 'sign_in' => 'sessions#new'
      post 'sign_in' => 'sessions#create'
    end
  end

  root to: 'home#index'
end
