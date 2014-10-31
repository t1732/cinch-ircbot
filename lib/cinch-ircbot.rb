require 'bundler/setup'
require 'cinch'

require_relative 'cinch-ircbot/bot_config'
require_relative 'cinch-ircbot/bot'
require_relative 'cinch-ircbot/daemon'
require_relative 'cinch-ircbot/encoder'
require_relative 'cinch-ircbot/plugins/hello'

module CinchIrcbot
  extend self

  def run
    daemon = Daemon.new
    daemon.run
  end

  def stop
    Process.exec("kill `cat #{BotConfig.pid_file}`")
    Process.exec("rm -f #{BotConfig.pid_file}")
  end
end
