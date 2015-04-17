class AuthorPolicy < ApplicationPolicy

  def update?
    author == record
  end
  
end
