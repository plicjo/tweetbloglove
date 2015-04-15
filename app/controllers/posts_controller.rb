class PostsController < ApplicationController
  before_action :authenticate_author!, except: [ :index, :show ]
  before_action :get_post, only: [:edit, :update, :show, :destroy]
  after_action :verify_authorized

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
    authorize @posts
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    respond_with @post
    authorize @post
  end

  def update
    @post.update(post_params)
    respond_with @post, location: root_path
  end

  def show
    respond_with @post
  end

  def destroy
    @post.destroy
    respond_with @post, location: root_path
  end

  private

    def post_params
      params.require(:post).permit(
        :title, :body, :featured_image, :twitter_message,
        :featured_image_cache, :author_id)
    end

    def get_post
      @post = Post.find(params[:id])
      authorize @post
    end

end
