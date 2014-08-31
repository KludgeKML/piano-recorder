#!/usr/bin/env ruby
### BEGIN INIT INFO
# Provides:          piano-logger
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: MIDI Piano Logger
# Description:       Logs keystrokes from MIDI Keyboard/Piano
### END INIT INFO

require 'daemons'

Daemons.run_proc('myproc.rb') do
  loop do
    sleep(5)
  end
end
