Rails.application.routes.draw do
  resources :summaries
  resources :departments
  resources :establishments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
