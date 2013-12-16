Quinara::Application.routes.draw do

  resources :courses do
    member do
      get :formato_evaluaciones
    end
    resources :alumnos do
      member do
        post :toggle
      end
    end
    resources :evaluacions, path: "evaluaciones" do
      member do
        get :view
        get :calificar
        get :delete_my_answer
        post :calificar_respuestas
        post :remove_file
      end
      collection do
        get :reuse
        post :reuse_evaluacion
      end
      resources :respuestas
    end
  end
  resources :answer_evaluacion do
    member do
      get :view
    end
  end
  resources :me

  get "login", to: "sessions#index", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  resources :sessions

  get :admin, to: "admin#index"
  namespace :admin do
    resources :users
    resources :courses do
      resources :evaluaciones_formato
    end
  end

  root "home#index"

  # unroutable paths:
  # match '*a', :to => 'application#routing_error', via: [:get, :post]
end
