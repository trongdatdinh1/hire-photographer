class RequestsController < ApplicationController
  before_action :authenticate_photographer!, only: [:create, :destroy]
  before_action :find_post, only: [:create, :destroy]

  def create
    current_photographer.apply @post
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end

  def destroy
    @apply_post = current_photographer.requests.build
    current_photographer.cancel_request @post
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end

  private

  def find_post
    @post = Post.find_by id: params[:post_id]
    unless @post
      flash[:notice] = t "some_thing_went_wrong"
      redirect_to root_path
    end
  end
end
