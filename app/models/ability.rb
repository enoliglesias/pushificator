class Ability
  include CanCan::Ability

  def initialize(user)
    can :access, :rails_admin
    can :dashboard
  end
end
