class RequestHandlersController < ApplicationController
  def create
    @post = Post.find_by id: params[:post_id]
    if @post.photographer
      flash[:alert] = t ".already_accepted_someone"
      redirect_to root_path
      return
    end
    @photographer = @post.candidates.find_by id: params[:photographer_id]
    unless @photographer
      flash[:alert] = t ".no_photographer"
      redirect_to root_path
      return
    end

    @post.photographer = @photographer

    if @post.save
      flash[:alert] = t ".accepted_request"
    else
      flash[:alert] = t ".some_thing_went_wrong"
    end

    redirect_to @post
  end
end
