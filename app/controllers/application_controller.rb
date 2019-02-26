class ApplicationController < ActionController::Base
  def current_photographer
    @current_photographer ||= super && Photographer.includes(:applied_posts).find @current_photographer.id
  end
end
