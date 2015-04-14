class PostsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create]
  before_action :get_post, only: [:edit, :update]
  
  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    respond_with @post
  end

  def update
    @post.update(post_params)
    respond_with @post, location: root_path
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  private

    def post_params
      params.require(:post).permit(
        :title, :body, :featured_image, :twitter_message,
        :featured_image_cache, :author_id)
    end

    def get_post
      @post = Post.find(params[:id])
    end

end
