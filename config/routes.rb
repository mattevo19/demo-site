Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :blogs, only: [:create, :index, :show, :edit, :update, :new, :destroy] do
    resources :reviews, only: [:create]
  end
  get "/disclosure", to: "pages#disclosure"
  get "/faq", to: "pages#faq"
  get "/insurance", to: "pages#insurance"
end
