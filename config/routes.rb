Rails.application.routes.draw do
  devise_for :users
  root to: 'jobs#match', as: 'match'
  # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)

  resources :candidate_interest_areas

  resources :companies, only: %i[show edit create destroy]

  resources :jobs # apenas para as companies

  resources :candidates, only: %i[show edit create destroy]

  resources :matches, only: %i[show create index]








  resources :cars do
    resources :orders, only: [:new, :create]
    delete 'delete_photo', on: :member
  end

  resources :orders, only: [:show, :index]

  get 'my_cars', to: 'cars#my_cars', as: 'my_cars'
  get 'my_orders', to: 'orders#index', as: 'my_orders'



  resources :candidates do
    member do
      get 'profile' # Página de perfil do candidato
      get 'interests' # Página de áreas de interesse do candidato
    end
  end
  resources :companies do
    member do
      get 'profile' # Página de perfil da empresa
      get 'jobs' # Página de vagas de emprego da empresa
    end
  end
  resources :jobs do
    member do
      get 'applicants' # Página de candidatos que se candidataram a uma vaga
    end
  end











  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
