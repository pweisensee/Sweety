# Tests for Report model
describe User, type: :model do
  it "has none to begin with" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    user = User.new(email: 'test@y.com', password: 'test1234')
    user.save
    expect(User.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(User.count).to eq 0
  end
end
