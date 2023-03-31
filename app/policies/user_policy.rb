class UserPolicy < ApplicationPolicy

  def update?
    user.present? && user == record
  end

  def delete?
    user.present? && user == record
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
