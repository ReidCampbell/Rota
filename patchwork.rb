require 'csv'
require_relative 'shift'

shift_one = Shift.new(1)
shift_two = Shift.new(2)

CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
    headers: ["Shift", "Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
    ) do |csv|
        csv << [shift_one.shift_number]
        csv << [shift_two.shift_number]
    end

