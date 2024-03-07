Rails.application.routes.draw do
  devise_for :users
  root to: 'jobs#match', as: 'match'
  # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)

  resources :candidate_interest_areas

  resources :companies, only: %i[show edit create destroy]

  resources :jobs # apenas para as companies

  resources :candidates, only: %i[show edit create destroy]

  resources :matches, only: %i[show create index]

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
