# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  patch 'products/:id/change_status', to: 'products#change_status', as: 'product_change_status'
  get 'products/:id/audits', to: 'products#audits', as: 'product_audits'
  get 'marketplaces/:id/add_mappings', to: 'marketplaces#add_mappings', as: 'marketplace_add_mappings'
  patch 'marketplaces/:id/save_mappings', to: 'marketplaces#save_mappings', as: 'marketplace_save_mappings'
  get 'products/:id/fetch_latest_data', to: 'products#fetch_latest_data', as: 'marketplace_fetch_latest_data'  
  resources :entities, :marketplaces, :products, :receiver_emails
  resources :requested_marketplaces, only: %i[index new create destroy]
  
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
