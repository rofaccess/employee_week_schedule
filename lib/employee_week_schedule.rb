# frozen_string_literal: true

require_relative "employee_week_schedule/version"

# Main module to make employee week schedule
# @author Rodrigo Fernández
module EmployeeWeekSchedule
  # Return a Hash representing the make schedule
  # @param week_number [Integer] The week_number of schedule requesting.
  # @param year [Integer] The year of schedule requesting.
  # @return [Hash] The Hash schedule.
  # @example Basic Example
  #   EmployeeWeekSchedule.make(10, 2020)
  #     => {}
  # @example Complex Example
  #   EmployeeWeekSchedule.make(10, 2020)
  #     => {}
  def make(week_number, year); end
  class Error < StandardError; end
  # Your code goes here...
end
