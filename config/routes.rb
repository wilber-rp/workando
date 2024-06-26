Rails
  .application
  .routes
  .draw do
    devise_for :users, controllers: { registrations: 'registrations' }

    # get '/user' => "welcome#index", :as => :user_root

    root to: 'jobs#index'

    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end

    # aqui estarão todas os possíveis matches(o index dos jobs cujo interest_area_id são os mesmos que do candidato)

    # get 'company', to: 'companies#show', as: :company
    resources :companies, only: %i[show new create edit update destroy]
    resources :jobs, only: %i[new create show edit update destroy] do
      resources :matches, only: %i[create destroy]
      post 'like', to: 'jobs#like', as: 'like'
      post 'dislike', to: 'jobs#dislike', as: 'dislike'
    end

    resources :matches, except: %i[create destroy] do
      resources :chatrooms, only: :create
    end

    # My jobs oppotunities
    get 'my_jobs', to: 'jobs#my_jobs', as: 'my_jobs'

    resources :candidates, only: %i[show index new create edit update] do
      post 'like', to: 'candidates#like', as: 'like'
      delete 'dislike', to: 'candidates#dislike', as: 'dislike'
    end

    get 'up' => 'rails/health#show', :as => :rails_health_check
  end
