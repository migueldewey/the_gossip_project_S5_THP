Rails.application.routes.draw do
  
  
  #resources :gossip , only: [:new,:create] 
	root 'gossip#index'

  resources :gossip
  resources :cities, only: [:show ]
  resources :comments
	#get 'cities/:id', to: 'cities#show', as: 'city'

  get 'user/:id', to: 'front#user', as: 'user'
  get 'team', to: 'front#team'
  get 'contact', to: 'front#contact'
  get 'welcome/:first_name', to: 'front#welcome'
  # For details on the DSL available within this file, 
  # see http://guides.rubyonrails.org/routing.html
end