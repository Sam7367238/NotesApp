class NotePolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  # def index?
  #   true
  # end

  def edit?
    user.id == record.user_id
  end

  def show?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
