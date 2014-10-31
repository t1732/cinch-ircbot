# -*- coding: utf-8 -*-
class Hello
  include Cinch::Plugin

  match Encoder.encode("hello"), prefix: /^/, suffix: /$/

  def execute(msg)
    msg.reply Encoder.encode("Hello World.")
  end
end
