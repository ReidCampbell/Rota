require 'csv'

CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
    headers: ["Shift", "Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
    ) do |csv|

    end

