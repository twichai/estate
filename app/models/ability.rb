# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.has_role?(:owner)
      # Owners can manage all listings and view all tenants
      can :manage, :all
    elsif user.has_role?(:tenant)
      # Tenants can only read listings
      can :read, :all
    end
  end
end
