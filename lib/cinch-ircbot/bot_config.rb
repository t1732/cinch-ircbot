class BotConfig
  class << self
    attr_accessor :pid_file, :irc, :cinch
  end

  config = eval File.read(File.expand_path('../../../config.rb', __FILE__))
  self.pid_file = config[:pid]   || "./cinch-ircbot.pid"
  self.irc      = config[:irc]   || {}
  self.cinch    = config[:cinch] || {}
end
