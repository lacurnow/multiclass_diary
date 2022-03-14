require 'phone_numbers'
require 'diary'
require 'contact_list'
require 'contact'

RSpec.describe PhoneNumbers do
  describe "#all_diary_numbers" do
    it "returns a list of valid phone numbers from within the diary entries" do
      diary = Diary.new
      friday = DiaryEntry.new("Friday", "I met Dave, 07845123123 is his number.")
      saturday = DiaryEntry.new("Saturday", "I went to the cinema and had a lovely time.")
      sunday = DiaryEntry.new("Sunday", "Mary's phone number is 07854777666")
      monday = DiaryEntry.new("Monday", "Quentin's phone number is 07854777555.")
      tuesday = DiaryEntry.new("Tuesday", "I met Dave again, his phone number is 07845123123") # Duplicate entry case.
      wednesday = DiaryEntry.new("Wednesday", "I met Steve, his phone number is 0784512 ") # Invalid number
      diary.add(friday)
      diary.add(saturday)
      diary.add(sunday)
      diary.add(monday)
      diary.add(tuesday)
      diary.add(wednesday)
      new_contact_list = ContactList.new
      phone_numbers = PhoneNumbers.new(diary, new_contact_list)
      result = phone_numbers.all_diary_numbers
      expect(result).to eq ["07845123123", "07854777666", "07854777555"]
    end
  end

  describe "#contact_numbers"
    it "returns a hash where the keys are names populated from a contactlist and numbers are values populated from a diary" do
      contact_list = ContactList.new
      contact_1 = Contact.new("Dave")
      contact_2 = Contact.new("Mary")
      contact_list.add(contact_1)
      contact_list.add(contact_2)
      diary = Diary.new
      friday = DiaryEntry.new("Friday", "I met Dave, 07845123123 is her number.")
      saturday = DiaryEntry.new("Saturday", "I went to the cinema and had a lovely time.")
      sunday = DiaryEntry.new("Sunday", "Mary's phone number is 07854777666")
      diary.add(friday)
      diary.add(saturday)
      diary.add(sunday)
      phone_numbers = PhoneNumbers.new(diary, contact_list)
      result = phone_numbers.contact_numbers
      expect(result).to eq "Dave": "07845123123", "Mary": "07854777666"
  end
end