class BreweryPolicy < ApplicationPolicy
  attr_reader :user, :brewery

  def index?
    true
  end

  def create?
    user.admin?
  end

end
