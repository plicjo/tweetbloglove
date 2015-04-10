class PostsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    respond_with @post
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def index
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :featured_image, :featured_image_cache, :author_id)
    end

end
