Rails.application.routes.draw do
  resources :books
  resources :recipients
  resources :keywords
  resources :keywordgroups

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

	root to: 'statics#index'
	get 'contact_us', to: 'statics#contact_us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
