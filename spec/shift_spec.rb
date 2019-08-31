require_relative '../shift'

RSpec.describe Shift do
    context "when created" do
        it "returns shift number" do
            shift = Shift.new(1)
            expect(shift.shift_number).to eq "Shift 1"
        end
    end

    context "when getting start date" do
        it "gets correct date" do
            start_time = Time.new(2018, 10, 17, 9.00)
            shift = Shift.new(1)
            expect(shift.shift_start_time).to eq start_time
        end

        it "formats correct date" do
            shift = Shift.new(1)
            expect(shift.display_shift_start_time).to eq "17-10-2018 09:00"
        end
    end

    context "when getting end date" do
        it "gets correct date for shift 1" do
            end_time = Time.new(2018, 10, 17, 15.00)
            shift = Shift.new(1)
            expect(shift.shift_end_time).to eq end_time
        end

        it "formats correct date for shift 1" do
            shift = Shift.new(1)
            expect(shift.display_shift_end_time).to eq "17-10-2018 15:00"
        end

        it "gets correct date shift 2" do
            end_time = Time.new(2018, 10, 18, 8.00)
            shift = Shift.new(2)
            expect(shift.shift_end_time).to eq end_time
        end

        it "formats correct date shift 2" do
            shift = Shift.new(2)
            expect(shift.display_shift_end_time).to eq "18-10-2018 08:00"
        end
    end

    context "getting total hours" do
        it "calculated the correct number of hours for shift 1" do
            shift = Shift.new(1) 
            expect(shift.total_hours).to eq 6
        end

        it "calculated the correct number of hours for shift 2" do
            shift = Shift.new(2) 
            expect(shift.total_hours).to eq 12
        end
    end


end
