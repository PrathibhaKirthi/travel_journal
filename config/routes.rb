Rails.application.routes.draw do
  devise_for :users

  resources :entries
  resources :journal_entries

  root "journal_entries#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
