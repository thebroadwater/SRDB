Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users, :skip => [:registrations]
  devise_for :users

  authenticate :user do
    resources :people, only: [:new, :create, :edit, :update, :destroy] do
      resources :person_sources
    end
  end
  resources :people, only: [:index, :show]

  authenticate :user do
    resources :sources, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :sources, only: [:index, :show]

  authenticate :user do
    resources :locations, only: [:new, :create, :edit, :update, :destroy] do
      resources :location_sources
    end
  end
  resources :locations, only: [:index, :show]


  authenticate :user do
    resources :groups, only: [:new, :create, :edit, :update, :destroy] do
      resources :group_sources
    end
  end
  resources :groups, only: [:index, :show]


  authenticate :user do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :events, only: [:index, :show]

  resources :results, only: [:index]

  authenticate :user do
    resources :occurrences, only: [:new, :create, :edit, :update, :destroy] do
      resources :occurrence_sources
      resources :occurrence_people
      resources :occurrence_groups
      resources :occurrence_locations
    end
  end
  resources :occurrences, only: [:index, :show]

  get 'root/index'
  root 'root#index'

  get 'sitemap', to: 'root#sitemap'

get '/timeline', to: redirect('/occurrences')

end
