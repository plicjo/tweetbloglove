class PostPolicy < ApplicationPolicy
  
  def show?
    true
  end

  def new?
    author.present?
  end

  def create?
    author.present?
  end

  def update?
    author.present? && author == post.author
  end

  def destroy?
    author.present? && author == post.author
  end

  private

    def post
      record
    end

end
