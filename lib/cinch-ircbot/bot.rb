# -*- coding: utf-8 -*-
class Bot
  def initialize
    irc_options = {
      server:   "irc.ircnet.ne.jp",
      port:     6667,
      realname: "cinch-ircbot",
      user:     "cinch-ircbot",
      nick:     "cinch-ircbot",
      channels: [],
    }.merge(BotConfig.irc)

    cinch_options = {
      verbose: false,
      plugins: [],
    }.merge(BotConfig.cinch)

    puts "irc:   #{irc_options.inspect}"
    puts "cinch: #{cinch_options.inspect}"

    @cinch = Cinch::Bot.new do
      configure do |c|
        c.server   = irc_options[:server]
        c.port     = irc_options[:port]
        c.password = irc_options[:password]
        c.realname = irc_options[:realname]
        c.user     = irc_options[:user]
        c.nick     = irc_options[:nick]
        c.channels = irc_options[:channels].collect{|o| Encoder.encode(o) }
        c.verbose  = cinch_options[:verbose]
        c.plugins.plugins = cinch_options[:plugins].collect{|n|
          Object.const_get(n.split("_").collect(&:capitalize).join)
        }
      end

      trap "SIGINT" do
        bot.quit
      end
    end
  end

  def start
    @cinch.start
  end
end
