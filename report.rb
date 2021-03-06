require 'csv'
require_relative 'shift'

class Report
    def generate_csv
        weekend = ["Saturday", "Sunday"]
        CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
        headers: ["Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
        ) do |csv| 
            Shift.shift_start_date.upto(Shift.shift_start_date + 7).each do |time| 
                shift_one = Shift.new(1, time)
                shift_two = Shift.new(2, time)

                unless weekend.include?(time.strftime("%A"))
                    csv << [shift_one.display_shift_time(shift_one.shift_start_time), shift_one.display_shift_time(shift_one.shift_end_time), shift_one.total_hours, shift_one.shift_rate, shift_one.total_shift_payment, shift_one.doctor.employer, shift_one.department]
                    csv << [shift_two.display_shift_time(shift_two.shift_start_time), shift_two.display_shift_time(shift_two.shift_end_time), shift_two.total_hours,  shift_two.shift_rate, shift_two.total_shift_payment, shift_two.doctor.employer, shift_two.department]
                end
            end
        end
    end    
end

