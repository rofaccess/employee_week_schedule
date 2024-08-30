# frozen_string_literal: true

RSpec.describe DailyShifts do
  describe "#build" do
    context "when full overlap, workers has the same availability" do
      it "return an array with one shift per worker" do
        availabilities = [
          { "start_time" => "19:00", "end_time" => "23:00", "worker" => "John" },
          { "start_time" => "19:00", "end_time" => "23:00", "worker" => "Sam" },
          { "start_time" => "19:00", "end_time" => "23:00", "worker" => "Dean" }
        ]
        shifts = DailyShifts.build(availabilities)
        expect(shifts).to eq(availabilities)
      end
    end

    context "when no overlap, workers has different availability" do
      it "return an array with one shift per worker" do
        availabilities = [
          { "start_time" => "06:00", "end_time" => "08:00", "worker" => "John" },
          { "start_time" => "08:00", "end_time" => "11:00", "worker" => "Sam" },
          { "start_time" => "12:00", "end_time" => "14:00", "worker" => "Dean" }
        ]
        shifts = DailyShifts.build(availabilities)
        expect(shifts).to eq(availabilities)
      end
    end

    context "when partial overlap, workers time ranges has partial overlap" do
      it "return an array with more than one shift per worker" do
        availabilities = [
          { "start_time" => "06:00", "end_time" => "10:00", "worker" => "John" },
          { "start_time" => "09:00", "end_time" => "13:00", "worker" => "Sam" },
          { "start_time" => "09:00", "end_time" => "14:00", "worker" => "Dean" }
        ]
        shifts = DailyShifts.build(availabilities)

        expected_result = [
          { "start_time" => "06:00", "end_time" => "10:00", "worker" => "John" },
          { "start_time" => "09:00", "end_time" => "13:00", "worker" => "Sam" },
          { "start_time" => "06:00", "end_time" => "09:00", "worker" => "John" }, # split shift
          { "start_time" => "10:00", "end_time" => "13:00", "worker" => "Sam" }, # split shift
          { "start_time" => "09:00", "end_time" => "14:00", "worker" => "Dean" },
          { "start_time" => "10:00", "end_time" => "14:00", "worker" => "Dean" }, # split shift
          { "start_time" => "13:00", "end_time" => "14:00", "worker" => "Dean" } # split shift
        ]
        expect(shifts).to eq(expected_result)
      end
    end
  end
end
