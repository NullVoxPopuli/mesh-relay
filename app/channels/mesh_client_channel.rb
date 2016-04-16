# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MeshClientChannel < ApplicationCable::Channel
  def subscribed
    stream_from "client_identified_by_#{uid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # messages received from the clients are handled
  # here. :-)
  def chat(data)
    # TODO: do we want to encrypt the from/to?
    #       - using https will already cover this?
    from = data['from'] # uid
    to = data['to'] # uid
    encrypted_message = data['message']

    # broadcast the message to the channel
    # that the to client is subscribed to.
    ActionCable.server.broadcast(
      "client_identified_by_#{to}",
      message: encrypted_message
    )
  end
end
