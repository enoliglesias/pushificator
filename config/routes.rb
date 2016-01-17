Rails.application.routes.draw do
  devise_for :user

  resources :notifications do
    get "send", on: :member
  end

  root to: "rails_admin/main#dashboard"


  mount Pushificator::V1 => '/'
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
