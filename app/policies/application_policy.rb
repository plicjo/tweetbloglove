class ApplicationPolicy
  attr_reader :author, :record

  def initialize(author, record)
    @author = author
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(author, record.class)
  end

  class Scope
    attr_reader :author, :scope

    def initialize(author, scope)
      @author = author
      @scope  = scope
    end

    def resolve
      scope
    end
  end
end

