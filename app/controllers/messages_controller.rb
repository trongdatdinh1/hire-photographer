class MessagesController < ApplicationController
  before_action :signed_in?, only: :create

  def create
    @post = Post.find_by id: params[:post_id]
    user = photographer_signed_in? ? current_photographer : current_customer
    recipient = user.class.to_s == "Photographer" ? @post.customer : @post.photographer
    unless (@post.customer.eql?(user) || @post.photographer.eql?(user))
      flash[:alert] = t ".no_permission"
      redirect_to root_path
    else
      @msg = Message.new post: @post, content: params[:message][:content]
      user.messages << @msg
      @msg.create_activity :create, owner: user, recipient: recipient
    end
  end

  private

  def signed_in?
    unless photographer_signed_in? || customer_signed_in?
      flash[:alert] = t ".must_login"
      redirect_to root_path
    end
  end

  def render_message message
    self.render partial: "messages/message", locals: {message: message}
  end
end
