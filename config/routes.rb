Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :user

  root to: "rails_admin/main#dashboard"

  mount GrapeSwaggerRails::Engine, at: "/documentation"

end
