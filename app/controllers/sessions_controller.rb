class SessionsController < ApplicationController
  def create
    @author = Author.find_or_create_from_auth_hash(auth_hash)
    session[:author_id] = @author.id
    redirect_to root_path, notice: 'Signed in successfully.'
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end