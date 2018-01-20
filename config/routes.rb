Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    collection do
      get "top", to: "restaurants#top"
      get "bottom", to: "restaurants#bottom"
    end
    member do
      get "chef", to: "restaurants#chef"
    end
    resources :reviews, only: [:new, :create]
  end
    resources :reviews, except: [:new, :create]

  namespace :admin do
    resources :restaurants, only: [:index]
  end
end
