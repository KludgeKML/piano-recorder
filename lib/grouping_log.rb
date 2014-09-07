## encoding: UTF-8

require_relative 'log_item'
require_relative 'grouping_helper'
require_relative 'time_grouping_helper'

class GroupingLog
  attr_writer :grouping_helper

  def initialize(file_name)
    @file_name = file_name
    @grouping_helper = TimeGroupingHelper.new
    start_of_group unless File.exist?(@file_name)
  end

  def log(message)
    log_item = LogItem.new(message)
    new_group unless @grouping_helper.group?(log_item)
    File.open(@file_name, 'a') do |f|
      f.write("#{log_item.time.to_i}\t#{log_item.message}\n")
    end
    @grouping_helper.update(log_item)
  end

  def start_of_group
    File.open(@file_name, 'a') { |f| f.write("GROUP_START\n") }
  end

  def end_of_group
    File.open(@file_name, 'a') { |f| f.write("GROUP_END\n\n") }
  end

  def new_group
    end_of_group
    start_of_group
  end

  def close
    end_of_group
  end
end
