Rails.application.routes.draw do
devise_for :users, controllers: {
        registrations: 'users/registrations'
      	}
resources :documents
resources :summaries do
	member do
		get 'delete_phase/:phase_id', to: "summaries#delete_phase", as: "delete_phase"
	end
end

resources :summary_phases
  
resources :departments
resources :establishments
root 'summaries#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
