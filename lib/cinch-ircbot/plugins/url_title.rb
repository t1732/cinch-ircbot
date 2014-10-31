require 'open-uri'
require 'nokogiri'

class UrlTitle
  include Cinch::Plugin

  listen_to :channel

  def get_title(url)
    res = Nokogiri::HTML(open(url)).at("title")
    res.text
  rescue OpenURI::HTTPError
    nil
  end

  def listen(msg)
    urls = URI.extract(msg.message, "http")
    titles = urls.collect{|url| get_title(url) }
    titles.each do |title|
      msg.channel.notice Encoder.encode(" => #{title}")
    end
  end
end
