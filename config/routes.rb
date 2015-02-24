Rails.application.routes.draw do
  root 'talks#index'
  resources :talks
  resources :registrations
end
