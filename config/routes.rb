Rails.application.routes.draw do
  resources :locations, only: %i(index new create show)

  root to: 'locations#index'
end
