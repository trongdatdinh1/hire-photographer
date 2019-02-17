class GalleriesController < ApplicationController
  before_action :authenticate_photographer!, only: [:new, :create]

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_photographer.galleries.build gallery_params
    if @gallery.save
      flash[:notice] = t ".gallery_successfully_created"
      redirect_to @gallery
    else
      render "galleries/new"
    end
  end

  def show
    @gallery = Gallery.find_by id: params[:id]
    return if @gallery
      flash[:notice] = t "some_thing_went_wrong"
      redirect_to root_path
  end

  private

  def gallery_params
    params.require(:gallery).permit :title, photos_attributes: [:title, :image]
  end
end
