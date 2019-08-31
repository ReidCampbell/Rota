require_relative '../shift'

RSpec.describe Shift do
    context "when created" do
        it "returns shift number" do
            shift = Shift.new(1)
            expect(shift.shift_number).to eq "Shift 1"
        end
    end
end