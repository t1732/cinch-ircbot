cinch-ircbot
============

## Installation

    $ git clone git@github.com:t1732/cinch-ircbot.git
    $ cd cinch-ircbot
    $ bundle install

## Usage

## start bot process

    $ bin/run

## stop process

    $ bin/stop

## Configure

edit config.rb

### irc options

    server:   "irc.ircnet.ne.jp",
    port:     6667,
    password: nil,
    realname: "cinch-ircbot",
    user:     "cinch-ircbot",
    nick:     "cinch-ircbot",
    encode:   "utf-8",      # irc setting text encode
    channels: ["#sample"],  # join channels

### cinch options

    verbose: false
    plugins: ["hello"]  # load plugin names
