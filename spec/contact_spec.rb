require 'contact'

RSpec.describe Contact do
  it "constructs" do
    contact_1 = Contact.new("Jon")
    expect(contact_1.name).to eq "Jon"
  end
end 