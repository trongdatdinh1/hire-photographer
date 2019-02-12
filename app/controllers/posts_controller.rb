class PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_customer.posts.build post_params
    if @post.save
      flash[:notice] = t ".post_successfully_created"
      redirect_to root_url
    else
      render "posts/new"
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :hourly_rate, :location
  end
end
