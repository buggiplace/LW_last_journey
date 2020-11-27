class DocumentPolicy < ApplicationPolicy
  def create?
    record.funeral.user == user
  end

  def destroy?
    record.funeral.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
