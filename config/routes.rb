Osra::Application.routes.draw do

  namespace :hq do
    resources :partners, except: [:destroy] do
      resources :orphan_lists, only: [:index]
      resources :pending_orphan_lists do
        delete 'destroy', on: :member
        get 'upload', on: :collection
        get 'validate', on: :collection
        get 'import', on: :collection
      end
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: "admin/dashboard#index"

  #build a new sponsorship on the Orphan class instead of the Sponsorship class
  get '/admin/sponsors/:sponsor_id/sponsorships/new', to: 'admin/orphans#index', as: :new_sponsorship

end
