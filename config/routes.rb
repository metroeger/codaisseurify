Rails.application.routes.draw do
    resources :artists

  root "artists#index"


  resources :songs


end
