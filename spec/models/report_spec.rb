# Tests for Report model
describe Report, type: :model do
  it "has no reports to begin with" do
    expect(Report.count).to eq 0
  end

  it "has one report after adding one daily report" do
    report = Report.new(start_date: Date.today, end_date: Date.today)
    report.save
    expect(Report.count).to eq 1
  end

  it "has one report after adding one ranged report" do
    report = Report.new(start_date: 3.months.ago.beginning_of_month, end_date: Date.today)
    report.save
    expect(Report.count).to eq 1
  end

  it "has no reports after one was created in a previous example" do
    expect(Report.count).to eq 0
  end
end
