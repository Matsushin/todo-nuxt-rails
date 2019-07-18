class TaskPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  def create?
    true
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
