require 'contact_list'
require 'contact'

RSpec.describe "integration" do
  it "adds a contact to the contacts list" do
    contact_list = ContactList.new
    contact_1 = Contact.new("Dave")
    contact_2 = Contact.new("Mary")
    contact_list.add(contact_1)
    contact_list.add(contact_2)
    result = contact_list.all_contacts
    expect(result).to eq [contact_1, contact_2]
  end
end
