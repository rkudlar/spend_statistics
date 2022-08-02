Rails.application.routes.draw do
  devise_for :users
  root 'records#index'
  resources :records, only: [:new, :edit, :create, :update, :destroy]
  get 'delete_records', to: 'records#delete_records'
end
