require_relative '../doctor'

RSpec.describe Doctor do

    context "calculates base rate based on title" do
        it "returns correct value for GP" do
            doctor = Doctor.new("GP", "MWF Hospital", 1)
            expect(doctor.base_rate).to eq 45 
        end

        it "returns correct value for Surgeon" do
            doctor = Doctor.new("Surgeon", "TT Agency", 1.3)
            expect(doctor.base_rate).to eq 60
        end
    end

end