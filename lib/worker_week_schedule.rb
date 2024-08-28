# frozen_string_literal: true

require_relative "shift_week_schedule/version"

# Main module to make worker week schedule.
# @author Rodrigo Fernández
module ShiftWeekSchedule
  # Return a Hash representing the made schedule
  # @param week_number [Integer] The week_number of schedule requesting.
  # @param year [Integer] The year of schedule requesting.
  # @param work_schedule [Array] An array of hashes representing the work time ranges by day.
  # @param workers_availabilities_schedules [Array] An array of hashes representing the work time ranges available
  #        by worker.
  # @return [Hash] The Hash schedule.
  # @note The hashes received must use the next ruby syntax: { "string key" => "string value"}. To prevent errors that
  #       may be caused by an incorrect interpretation of the input data.
  #
  # @example Basic Example
  #   # The start and end time must be a string
  #   # The day must be a string like "Monday" or "1" representing the day one or some database id.
  #   work_schedule = [
  #     { "start_time" => "10:00", "end_time" => "21:00", "day" => "Monday" },
  #     { "start_time" => "19:00", "end_time" => "23:00", "day" => "Tuesday" }
  #   ]
  #
  #   # The start_time, end_time and day has the same rules of previous array.
  #   # The worker has same day rules. Example values: "John", "1".
  #   workers_availabilities_schedules = [
  #     { "start_time" => "11:00", "end_time" => "21:00", "day" => "Monday", "worker" => "Sam" },
  #     { "start_time" => "19:00", "end_time" => "23:00", "day" => "Tuesday", "worker" => "Dean" },
  #     { "start_time" => "19:00", "end_time" => "23:00", "day" => "Tuesday", "worker" => "Sam" }
  #   ]
  #
  #   ShiftWeekSchedule.make(10, 2020, work_schedule, workers_availabilities_schedules)
  #     => {}
  def make(week_number, year, work_schedule, workers_availabilities_schedules); end
  class Error < StandardError; end
  # Your code goes here...
end
