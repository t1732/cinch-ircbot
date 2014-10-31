class Daemon
  def initialize
    @pid_file = BotConfig.pid_file
  end

  #
  def run
    begin
      daemonize

      bot = Bot.new
      bot.start
    rescue => e
      STDERR.puts "[ERROR][#{self.class.name}.run] #{e}"
      exit 1
    end
  end

  private

  def daemonize
    begin
      Process.daemon(true, false)
      open(@pid_file, 'w') {|f| f << Process.pid} if @pid_file
    rescue => e
      STDERR.puts "[ERROR][#{self.class.name}.daemonize] #{e}"
      exit 1
    end
  end
end
