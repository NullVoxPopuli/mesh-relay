# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MeshRelayChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{uid}"
    ConnectedList.add(uid)
  end

  def unsubscribed
    ConnectedList.remove(uid)
  end

  # messages received from the clients are handled
  # here. :-)
  def chat(data)
    # uid of the intended recipient
    # only the intended recipient will be able to decrypt
    to = data['to']

    # if ConnectedList.include?(to)
    encrypted_message = data['message']

    # broadcast the message to the channel
    # that the to client is subscribed to.
    ActionCable.server.broadcast(
      "#{to}",
      message: encrypted_message
    )
  end
end
