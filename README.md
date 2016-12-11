# crystal_ssh

This project aims to fully implement the libssh bindings in Crystal languge.
Allowing programmers to spin up ssh servers and clients

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal_ssh:
    github: bararchy/crystal_ssh
```

## Usage

```crystal
require "crystal_ssh"

   ssh = SSHServer.new(
      username: "foo",
      password: "bar",
      rsakey: "spec/foo.key",
      timeout: "360",
      port: "2020",
      banner: "Welcome to Crystal SSH :)",
      listen_address: "0.0.0.0",
    ) 
  # Without a spawn this will block
  # When client side is ready the check would be to see if the server responds
  ssh.listen
```

You can always look at the sepcs to see examples 

## Development

TODO:  
* [ ] Adding full authentication for user & pass  
* [ ] Adding more hooks for events 
* [ ] Adding the shell integration  
* [ ] More stuff :)  

## Contributing

1. Fork it ( https://github.com/bararchy/crystal_ssh/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [bararchy](https://github.com/bararchy) bararchy - creator, maintainer
