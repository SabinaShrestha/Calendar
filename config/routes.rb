Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'

  resources :months do
    resources :days do
      resources :events
    end
  end
end
