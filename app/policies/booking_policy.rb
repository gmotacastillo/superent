class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def change_status?
    true
  end
 #because it inherits its stil true/false for all actions
end
