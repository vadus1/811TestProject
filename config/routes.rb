Rails.application.routes.draw do

  root 'welcome#index'

  resources :locations
end
