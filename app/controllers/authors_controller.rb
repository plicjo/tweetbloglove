class AuthorsController < ApplicationController
  before_action :authenticate_author!
  before_action :get_author
  after_action :verify_authorized

  def edit
  end

  def update
    @author.update(author_params)
    respond_with @author, location: root_path
  end

  private

    def author_params
      params.require(:author).permit(:time_zone)
    end

    def get_author
      @author = current_author
      authorize @author
    end
end
