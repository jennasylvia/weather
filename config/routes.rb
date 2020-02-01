Rails.application.routes.draw do
  root 'maps#new'
  resources :maps
end
