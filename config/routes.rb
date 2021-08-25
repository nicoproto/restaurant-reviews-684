Rails.application.routes.draw do
  resources :restaurants do
    # Every route here starts with '/restaurants'
    collection do
      # get '/restaurants/top', to: 'restaurants#top'
      get :top
    end

    member do
      get :chef
    end
  end
end
