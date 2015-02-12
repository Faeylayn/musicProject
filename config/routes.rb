Rails.application.routes.draw do
  resources :users
  resource :session
  resources :bands do
    post '/albums/new' => 'albums#new'
  end



  resources :albums, :only => [:index, :create, :edit, :update, :destroy, :show] do
    post '/tracks/new' => 'tracks#new'
  end


  resources :tracks, :only => [:index, :create, :edit, :update, :destroy, :show]


end
