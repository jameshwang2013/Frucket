Rails.application.routes.draw do

  resources :buckets do
    resources :events do
      member do
        patch :complete
        end
    end
  end

  root "buckets#index"

  resources :pins

  devise_for :users  
  get "upcoming" => "pins#upcoming"
  get "planning" => "pins#planning"
  get "ideas" => "pins#ideas"
  get "about" => "pages#about"


end
