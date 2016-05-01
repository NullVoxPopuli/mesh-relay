# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Channel < ActionCable::Channel::Base
    # identified_by :uuid
    #
    # def connect
    #   self.uuid = SecureRandom.uuid
    # end
  end
end
