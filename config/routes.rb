Rails.application.routes.draw do

  root 'locations#index'
  resources :locations, except: :destroy
end
