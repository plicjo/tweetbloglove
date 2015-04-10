class SessionsController < ApplicationController
  
  def create
    @author = Author.find_or_create_from_auth_hash(auth_hash)
    session[:author_id] = @author.id
    redirect_to root_path, notice: 'Signed in successfully.'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out successfully.'
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end