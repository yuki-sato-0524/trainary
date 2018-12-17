Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login"=>"sessions#new"
  post "login"=>"sessions#create"
  delete "logout"=>"sessions#destroy"
  
  get "signup" => "users#new"
  resources :users, :only => [:show, :create, :destroy, :edit, :update]
  
  
  get "analysis" => "diaries#analysis"
  resources :diaries, :only => [:new, :create, :destroy, :edit, :update, :index]
  
  resources :goals, :only =>[:new, :create, :edit, :update]
  
  resources :boards, :only =>[:new, :create, :destroy, :index, :show] do
    member do
      get :favorites
    end
  end
  resources :favorites, :only =>[:create, :destroy]
  
  
end
