#!/usr/bin/env ruby
# encoding: UTF-8

require 'unimidi'
require_relative 'grouping_log'

# logs MIDI data coming from a piano or keyboard
class PianoLogger
  def initialize(device_name, log_file_name)
    @device = UniMIDI::Input.find_by_name(device_name)
    @device.open
    fail "Could not open #{device_name}!" if @device.nil?

    @log = GroupingLog.new(log_file_name)
    fail "Could not create log #{new_file_name}!" if @log.nil?
  end

  def start_logging
    @continue_log = true

    while @continue_log
      m = @device.gets
      @log.log(m)
    end

    @log.close
  end

  def stop_logging
    @continue_log = false
  end
end

pl = PianoLogger.new('nanoPAD', 'piano.log')
pl.start_logging
