class DigitalWillPolicy < ApplicationPolicy
  def show?
    record.funeral.user == user
  end

  def update?
    record.funeral.user == user
  end 
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
