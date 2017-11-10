class BreadcrumbPolicy < ApplicationPolicy
  attr_reader :user, :breadcrumb

  def initialize(user, breadcrumb)
    @user = user
    @breadcrumb = breadcrumb
  end

  def edit?
    @user.id == @breadcrumb.user_created_id
  end

  def update?
    @user.id == @breadcrumb.user_created_id
  end

  def destroy?
    @user.id == @breadcrumb.user_created_id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
