class PostsController < ApplicationController
  before_action :authenticate_author!, except: [ :index, :show ]
  before_action :get_post, only: [:edit, :update, :show, :destroy]
  after_action :verify_authorized, except: :index
  after_action :set_publish_time, only: [:update, :create]
  require 'will_paginate/array'

  def index
    @posts = Post.published_or_authored(current_author)
                 .paginate(page: params[:page], per_page: 10)
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
        :title, :body, :featured_image, :twitter_message, :published,
        :featured_image_cache, :author_id, :publish_in_future)
    end

    def get_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def set_publish_time
      if !@post.published && publish_in_future
        @post.publish_later(time_to_publish) 
      end
    end

    def time_to_publish
      DateTime.new(
        params[:post]["publish_date(1i)"].to_i,
        params[:post]["publish_date(2i)"].to_i,
        params[:post]["publish_date(3i)"].to_i,
        params[:post]["publish_date(4i)"].to_i,
        params[:post]["publish_date(5i)"].to_i
      )
    end

    def publish_in_future
      params[:post][:publish_in_future] == "1"
    end

end
