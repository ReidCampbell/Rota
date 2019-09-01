require_relative '../shift'

RSpec.describe Shift do

    let(:time) { Time.new(2018, 10, 17, 9.00) }
    let(:shift_one) { Shift.new(1, time) }
    let(:shift_two) { Shift.new(2, time) }

    context "date and time" do
        it "gets correct end time" do
            end_time = Time.new(2018, 10, 17, 15.00)
            expect(shift_one.shift_end_time).to eq end_time.to_datetime
        end 
        
        it "gets correct start time" do
            start_time = Time.new(2018, 10, 17, 9.00)
            expect(shift_one.shift_start_time).to eq start_time.to_datetime
        end 

        it "correctly formats for display" do
            expect(shift_one.display_shift_time(shift_one.shift_start_time)).to eq "17-10-2018 09:00"
        end
    end

    context "number of hours" do
        it "calculated correctly for shift 1" do
            expect(shift_one.total_hours).to eq 6
        end 
        
        it "calculated correctly for shift 2" do
            expect(shift_two.total_hours).to eq 12
        end
    end

    context "shift rate" do
        it "should return correctly for Mon, Wed, Fri" do
            expect(shift_one.shift_rate).to eq 45
        end    
        
        it "should return correctly for Tues, Thurs" do
            shift_one = Shift.new(1, Time.new(2018, 10, 18, 9.00))
            expect(shift_one.shift_rate).to eq 60
        end
    end

    context "department" do
        it "should display correctly for shift 1" do
            expect(shift_one.department).to eq "General Medicine"
        end
    

        it "should display correctly for shift 2" do
            expect(shift_two.department).to eq "A&E"
        end
    end

    context 'shift 1 payments' do
        it "should calculate correctly for Mon, Wed, Fri" do
            doctor = Doctor.new("GP", "MWF Hospital", 1) 
            expect(shift_one.total_shift_payment).to eq 270
        end

        it "should calculate correctly for Tues, Thurs" do
            doctor = Doctor.new("Surgeon", "TT Agency", 1.3)
            shift_one = Shift.new(1, Time.new(2018, 10, 18, 9.00))
            expect(shift_one.total_shift_payment).to eq 468
        end
    end

    context 'shift 2 payments' do
        it "should calculate correctly for Mon, Wed, Fri" do
            doctor = Doctor.new("GP", "MWF Agency", 1.8) 
            expect(shift_two.total_shift_payment).to eq 1782
        end

        it "should calculate correctly for Tues, Thurs" do
            doctor = Doctor.new("Surgeon", "TT Hospital", 1)
            shift_two = Shift.new(2, Time.new(2018, 10, 18, 20.00))
            expect(shift_two.total_shift_payment).to eq 1080
        end
    end
end
