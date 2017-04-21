Rails.application.routes.draw do
  resources :students 
  resources :groups 
  resources :events do
    member do
    	post :check_in
    end
  end

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
