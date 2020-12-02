class FuneralPolicy < ApplicationPolicy
  def dashboard?
    record.user == user
  end

  def index_documents?
    record.user == user
  end

  def create_documents?
    record.user == user
  end

  def destroy_documents?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new_rep?
    record.user == user
  end

  def create_rep?
    record.user == user
  end
end
