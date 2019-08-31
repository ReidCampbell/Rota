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
end
