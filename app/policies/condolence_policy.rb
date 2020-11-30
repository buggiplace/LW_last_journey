class CondolencePolicy < ApplicationPolicy
  def destroy?
    record.funeral.representative == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
