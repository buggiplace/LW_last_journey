class ObituaryPolicy < ApplicationPolicy
  def show?
    record.funeral.user == user || record.funeral.representative == user
  end

  def update?
    record.funeral.user == user || record.funeral.representative == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
