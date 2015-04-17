require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :author_not_authorized

  self.responder = ApplicationResponder
  respond_to :html

  around_filter :author_time_zone, if: :current_author

  helper_method :current_author, :author_signed_in?

  def pundit_user
    current_author
  end
  
  private

    def current_author
      @current_author ||= Author.find(session[:author_id]) if session[:author_id]
    end

    def author_signed_in?
      return true if current_author
    end

    def authenticate_author!
      redirect_to root_url, alert: 'Please sign in first.' unless current_author
    end

    def author_time_zone &block
      Time.use_zone(current_author.time_zone, &block)
    end

    def author_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(root_path)
    end

end
