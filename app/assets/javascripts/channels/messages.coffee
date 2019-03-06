$(() ->
  App.messages = App.cable.subscriptions.create {channel: "MessagesChannel", post_id: $('#post_id').val()},
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#new_message')[0].reset()
      $('#chat').prepend data.message
)
