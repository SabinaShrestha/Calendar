Rails.application.routes.draw do



  resources :months do
    resources :days do
      resources :events
    end
  end
end
