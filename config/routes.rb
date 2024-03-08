Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)
  resources :candidates, only: %i[new create show]
  resources :jobs, only: %i[new create show index edit update destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
