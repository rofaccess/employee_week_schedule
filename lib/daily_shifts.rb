# frozen_string_literal: true

require "time"

# Module to build daily shifts.
# @author Rodrigo Fernández
module DailyShifts
  class << self
    # Build all shifts possibles for a day according worker availabilities.
    # @param availabilities [Array] A array of hashes with worker availabilities.
    # @return [Array] A array of arrays of all shifts built.
    # @todo The availabilities received has one availability by employee, that is, each employee has only one
    #       availability time range by day. An improvement may be support more the one time range by employee
    #       for one day.
    # @example
    #   availabilities = [
    #     { "start_time" => "19:00", "end_time" => "23:00", "worker" => "Sam" },
    #     { "start_time" => "19:00", "end_time" => "23:00", "worker" => "Dean" },
    #     { "start_time" => "19:00", "end_time" => "23:00", "worker" => "John" }
    #   ]
    #   DailyShifts.build(availabilities)
    #     => []
    def build(availabilities)
      combined_availabilities = combine_availabilities(availabilities)

      result = {}

      combined_availabilities.each do |availability_pair|
        availability1 = availability_pair.first
        availability2 = availability_pair.last

        # when full overlap, workers has same availability (start_time1 == start_time2 && end_time1 == end_time2)
        # when no overlap, workers has different availability (end_time1 <= start_time2 || end_time2 <= start_time1)
        # when partial overlap, all availabilities is valid
        save_availability(availability1, result)
        save_availability(availability2, result)
        # when partial overlap, workers time ranges has partial overlap
        # and will create new availabilities, splitting shifts according overlapped time range
        save_new_availabilities(availability1, availability2, result)
      end

      result.values
    end

    private

    def save_new_availabilities(availability1, availability2, result)
      start_time1, end_time1 = parse_times(availability1)
      start_time2, end_time2 = parse_times(availability2)

      return unless end_time1 > start_time2 && end_time2 > start_time1 # This is the inverse of no overlap condition

      if availability1["start_time"] != availability2["start_time"]
        save_new_availability(availability1["start_time"], availability2["start_time"], availability1["worker"], result)
      end

      return unless availability1["end_time"] != availability2["end_time"]

      save_new_availability(availability1["end_time"], availability2["end_time"], availability2["worker"], result)
    end

    def save_availability(availability1, result)
      key = build_key(*extract_values(availability1))
      result[key] = availability1
    end

    def save_new_availability(start_time, end_time, worker, result)
      new_availability = build_availability(start_time, end_time, worker)
      save_availability(new_availability, result)
    end

    # Return an array of pairs of availabilities
    # @example
    #   # time_range_worker is a hash with keys start_time, end_time and worker
    #   # Next array format was use for ease of comprehension
    #   availabilities = [time_range_worker_1, time_range_worker_2, time_range_worker_3]
    #   combine_availabilities(availabilities)
    #     => [
    #           [time_range_worker_1, time_range_worker_2],
    #           [time_range_worker_1, time_range_worker_3],
    #           [time_range_worker_2, time_range_worker_3]
    #        ]
    def combine_availabilities(availabilities)
      availabilities.combination(2).to_a
    end

    def parse_times(availability)
      start_time = Time.parse(availability["start_time"])
      end_time = Time.parse(availability["end_time"])

      [start_time, end_time]
    end

    def build_key(worker, start_time, end_time)
      "#{worker}-#{start_time}-#{end_time}"
    end

    def extract_values(availability)
      [availability["worker"], availability["start_time"], availability["end_time"]]
    end

    def build_availability(start_time, end_time, worker)
      { "start_time" => start_time, "end_time" => end_time, "worker" => worker }
    end
  end
end
