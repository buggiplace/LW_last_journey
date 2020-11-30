class CondolencePolicy < ApplicationPolicy
  def destroy?
    record.funeral.representative_profile.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
