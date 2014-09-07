## encoding: UTF-8

class LogItem
  attr_reader :time
  attr_reader :message

  def initialize(message = 'empty log message')
    @message = message
    @time = Time.now
  end
end
