Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :status ,only: [:index, :create]
  resources :historia, only: [:index, :create, :update, :destroy] do
    collection do
      get 'search'  #Endpoint para filtros
    end
  end
  resources :tarefa, only: [:index, :create, :update, :destroy] do
    collection do
      get 'search'  #Endpoint para filtros
    end

    get 'tarefa', to: 'tarefa#index'
    get 'tarefa/search', to: 'tarefa#search'

  end

end
