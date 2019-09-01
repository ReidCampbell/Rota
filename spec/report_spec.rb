require_relative '../report'

RSpec.describe Report do
    it "generates csv" do
        report = Report.new
        report.generate_csv
        expect(File.exists?("#{__dir__}/../WeeklyShiftReport.csv")).to eq(true)
    end
end