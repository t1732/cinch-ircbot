module Encoder
  extend self

  def encode(value)
    value.encode(BotConfig.irc[:encode] || "utf-8").force_encoding('external')
  end
end
