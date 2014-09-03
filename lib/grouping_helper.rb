## encoding: UTF-8

DEAD_AIR_SECONDS = 5 * 60

# Helps decide whether two events form part of a group or not
module GroupingHelper
  def group?(time_a, time_b)
    (time_b.to_i - time_a.to_i) < DEAD_AIR_SECONDS
  end
end
