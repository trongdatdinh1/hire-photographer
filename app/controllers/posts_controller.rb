class PostsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_customer!, only: [:new, :create]
  before_action :signed_in?, only: :index

  def index
    if photographer_signed_in?
      @q = Post.available.latest.ransack params[:q]
      @pagy, @posts = pagy @q.result
      @apply_post = current_photographer.requests.build
    elsif customer_signed_in?
      @q = Post.by_customer(current_customer).latest.ransack params[:q]
      @pagy, @posts = pagy @q.result
    end
  end

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
    params.require(:post).permit :title, :hourly_rate, :location, :hire_date, :address
  end

  def signed_in?
    unless photographer_signed_in? || customer_signed_in?
      flash[:alert] = t ".must_login"
      redirect_to root_path
    end
  end
end
