Rails.application.routes.draw do
  resources :students
  resources :groups do |t|
  	member do
  		post :add_student
  	end
  end
  resources :events

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
