## encoding: UTF-8

class GroupingLog
  include GroupingHelper

  def initialize(file_name)
    @file_name = file_name
  end

  def log(message)
    File.open(@file_name, 'a') do |f|
      timestamp = Time.now
      f.write("#{timestamp.to_i} #{message}\n")
    end
  end

  def start_of_group
    File.open(@file_name, 'a') { |f| f.write("GROUP_START")}
  end

  def end_of_group
    File.open(@file_name, 'a') { |f| f.write("GROUP_END\n\n")}
  end

  def close
    end_of_group
  end
end
