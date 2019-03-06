class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_#{params[:post_id]}"
  end
end
