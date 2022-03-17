Rails.application.routes.draw do
  devise_for :users, controllers:{ 
    sessions: 'auth/sessions',
    registrations: 'auth/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
 
  get 'generate_report' ,to: "reports#generate_report"
  post 'generate_report' ,to: "reports#generate_report"
  resources :users, only: %i[ index ]
  resources :reports, only: %i[ index ]
  namespace :public do 
    resources :checks, only: %i[  new create  ]
    
  end
  
end
 