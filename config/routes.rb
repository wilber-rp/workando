Rails
  .application
  .routes
  .draw do
    devise_for :users

    # get '/user' => "welcome#index", :as => :user_root

    root to: 'jobs#index'

    # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)

    resources :companies, only: %i[show new create edit update destroy]
    resources :jobs, only: %i[new create show edit update destroy] do
      post 'like', to: 'jobs#like', as: 'like'
      delete 'dislike', to: 'jobs#dislike', as: 'dislike'
    end
    resources :candidates, only: %i[index new create show edit update] do
      post 'like', to: 'candidates#like', as: 'like'
      delete 'dislike', to: 'candidates#dislike', as: 'dislike'
    end
    resources :matches, only: %i[create delete]

    get 'up' => 'rails/health#show', :as => :rails_health_check
  end
