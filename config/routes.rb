Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :websites
  resources :users
  resources :collections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  delete 'static_pages/destroy'
  get 'static_pages/collection'
  get 'static_pages/show'
end
