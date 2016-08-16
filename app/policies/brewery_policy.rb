class BreweryPolicy < ApplicationPolicy
  attr_reader :user, :brewery

  def index?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def show?
    true
  end

end
