# MeshRelay

This is a public relay server for [mesh-chat](https://github.com/neuravion/mesh-chat)


See [these test scripts](https://gist.github.com/NullVoxPopuli/edfcbbe91a7877e445cbde84c7f05b37) for how to interact with the relay.


## How to Deploy

- push to new heroku app
- add the redis-cloud addon
- point your clients at `ws://you-heroku-app-name.herokuapp.com?uid=your_users_id`

## Sending messages


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
