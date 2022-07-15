Rails.application.routes.draw do
  devise_for :users
  get '/urls' => 'urls#index'
  get '/:short_url' => 'urls#redirect'
  root :to => "urls#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :urls

  namespace :api do
    resources :regions, :provinces,:districts,:city_municipalities,:barangays, only: :index, defaults: {format: :json}
  end

  get "*path" => "urls#content_not_found" #404
end

