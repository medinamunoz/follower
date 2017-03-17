Rails.application.routes.draw do
  devise_for :users
  resources :documents
  resources :summaries
  resources :departments
  resources :establishments
  root 'summaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
