# MeshRelay

This is a public relay server for [mesh-chat](https://github.com/neuravion/mesh-chat)


See [these test scripts](https://gist.github.com/NullVoxPopuli/edfcbbe91a7877e445cbde84c7f05b37) for how to interact with the relay.


## How to Deploy

- push to new heroku app
- add the redis-cloud addon
- point your clients at `ws://you-heroku-app-name.herokuapp.com`
