Rails
  .application
  .routes
  .draw do
    devise_for :users

    # get '/user' => "welcome#index", :as => :user_root

    root to: 'jobs#index'

    # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)

    get 'company', to: 'companies#show', as: :company
    resources :companies, only: %i[new create edit update destroy]
    resources :jobs, only: %i[new create show edit update destroy] do
      resources :matches, only: %i[index create destroy]
      post 'like', to: 'jobs#like', as: 'like'
      delete 'dislike', to: 'jobs#dislike', as: 'dislike'
    end
    get 'candidate', to: 'candidates#show', as: :candidate
    resources :candidates, only: %i[index new create edit update] do
      post 'like', to: 'candidates#like', as: 'like'
      delete 'dislike', to: 'candidates#dislike', as: 'dislike'
    end

    get 'up' => 'rails/health#show', :as => :rails_health_check
  end
