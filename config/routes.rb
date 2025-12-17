Rails.application.routes.draw do
  devise_for :users

  resources :journal_entries
  resources :entries

  root "journal_entries#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
