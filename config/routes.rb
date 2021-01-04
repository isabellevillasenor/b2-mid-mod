Rails.application.routes.draw do
  resources :studios, only: [:index] 
  
  resources :movies, only: [:show] do
    resources :actors, only: [:create]
  end
 
end
