require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_author, :author_signed_in?

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def author_signed_in?
    current_author
  end

end
