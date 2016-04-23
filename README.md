# MeshRelay

This is a public relay server for [mesh-chat](https://github.com/neuravion/mesh-chat)


See [these test scripts](https://gist.github.com/NullVoxPopuli/edfcbbe91a7877e445cbde84c7f05b37) for how to interact with the relay.


## How to Deploy

- push to new heroku app
- add the redis-cloud addon
- point your clients at `ws://you-heroku-app-name.herokuapp.com?uid=your_users_id`

## Sending messages

You may use any websocket client as long as it adheres to action_cable message formatting, such as [action_cable_client (ruby)](https://github.com/NullVoxPopuli/action_cable_client)

Messages should be sent with the `chat` command and with a payload of `{ to: recipient_uid, message: encrypted_data }`

```ruby
client.perform('chat', {
  to: 'user1',
  message: 'hello from user2'
})
```

## Receiving messages

Received messages will look like this:

```
{ message: encrypted_data }
```

## Current Relays

### US
 - mesh-relay-in-us-1.herokuapp.com
 - mesh-relay-us-2.herokuapp.com
### EU
 - mesh-relay-eu-1.herokuapp.com
 - mesh-relay-eu-2.herokuapp.com

___________________________________

Note: all the examples are in ruby. All messages sent and received should be JSON formatted.
