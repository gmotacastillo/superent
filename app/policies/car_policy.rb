class CarPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where("end_date >= ?", DateTime.now)
    end
  end
  def index?
    true
  end
  def show?
    true
  end
  def update?
    record.user == user

  end
  def edit?
    #edit possible if yes
    record.user == user

  end

end
