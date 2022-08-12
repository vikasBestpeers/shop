# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
      if user.role == true
        cannot :manage, Order
        cannot :manage, Cart
        can :manage, Product
      else
        cannot :manage, Product
        can :manage,Cart
        can :manage,Order

      end
  end
end
