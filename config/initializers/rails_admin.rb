RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
   config.authorize_with :cancan

   config.model 'User' do
     navigation_icon 'icon-user'
   end

   config.model 'Device' do
     navigation_icon 'icon-hdd'
   end

   config.model 'Notification' do
     navigation_icon 'icon-bell'
   end

   config.model 'ApiKey' do
     navigation_icon 'icon-cog'
   end


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
