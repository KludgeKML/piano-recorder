## encoding: UTF-8

require_relative 'grouping_helper'

DEAD_AIR_SECONDS = 5 * 60

# Helps decide by times whether an event forms part of a group or not
class TimeGroupingHelper < GroupingHelper
  attr_writer :last_time

  def initialize
    @last_time = Time.now
  end

  def group?(log_object)
    (log_object.time.to_i - @last_time.to_i) < DEAD_AIR_SECONDS
  end

  def update(log_object)
    @last_time = log_object.time
  end
end
