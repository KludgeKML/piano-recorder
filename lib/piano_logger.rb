# encoding: UTF-8

require 'unimidi'

class PianoLogger
  def initialize(device_name)
    @device = UniMIDI::Input.find_by_name(device_name)
    @device.open
    fail "Could not open #{device_name}!" if @device.nil?
  end

  def start_logging
    @continue_log = true

    while @continue_log
      m = @device.gets
      File.open('piano.log', 'a') do |f|
        f.write(Time.now.to_i)
        f.write(m)
        f.write("\n")
     end
    end
  end

  def stop_logging
    @continue_log = false
  end
end

pl = PianoLogger.new('nanoPAD')
pl.start_logging
