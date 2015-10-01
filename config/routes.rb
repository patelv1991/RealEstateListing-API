Rails.application.routes.draw do
  root to: 'static_pages#root'
  resources :listings, only: [:index], defaults: { format: :json }
end
