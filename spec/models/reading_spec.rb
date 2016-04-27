# Tests for reading model
describe Reading, type: :model do
  describe 'attributes' do
    it "allows reading and writing of a valid :glucose_level" do
      reading = Reading.new
      reading.glucose_level = 5
      expect(reading.glucose_level).to eq 5
    end
  end

  it "has none to begin with" do
    expect(Reading.count).to eq 0
  end

  describe "reading exists after creation" do
    it "has one after adding one" do
      reading = Reading.new(glucose_level: 5)
      reading.save
      expect(Reading.count).to eq 1
    end
  end

  it "has none after one was created in a previous example" do
    expect(Reading.count).to eq 0
  end
end
