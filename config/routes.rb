Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :skip => [:registrations]

  resources :people do
    resources :person_sources
  end

  resources :sources

  resources :locations do
    resources :location_sources
  end

  resources :groups do
    resources :group_sources
  end

  resources :events
  resources :occurrences do
    resources :occurrence_sources
  end

  get 'welcome/index'
  root 'welcome#index'
end
