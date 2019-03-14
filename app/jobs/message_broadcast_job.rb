class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform message
    ActionCable.server.broadcast "post_#{message.post_id}", message: render_message(message)
  end

  private

  def render_message message
    PostsController.render partial: "messages/message", locals: {message: message}
  end
end
