Rails.application.routes.draw do
  resources :locations, only: %i(index new create show edit update)

  root to: 'locations#index'
end
