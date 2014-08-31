# encoding: UTF-8

require 'unimidi'

class PianoLogger
  def initialize(device_name)
    @device = UniMIDI::Input.find_by_name(device_name)
    fail "Could not open #{device_name}!" if @device.nil?
  end

  def start_logging
    @continue_log = true

    while @continue_log
      m = @device.gets
      puts(m)
    end
  end

  def stop_logging
    @continue_log = false
  end
end
