require_relative 'diary'
require_relative 'contact_list'
require_relative 'contact'

class PhoneNumbers
  def initialize(diary, contact_list)
    @diary = diary
    @contact_list = contact_list
  end

  def all_diary_numbers
    list_of_phonenumbers = []
    @diary.entries.each { |entry|
      current_phonenumber = entry.contents[/(?<!\d)\d{11}(?!\d)/]
      if (current_phonenumber) && !(list_of_phonenumbers.include?(current_phonenumber))
        list_of_phonenumbers << current_phonenumber
      end
    }
    return list_of_phonenumbers
  end

  def contact_numbers
    names_and_numbers = {}
    @contact_list.all_contacts.each { |contact|
      if !names_and_numbers.include?(contact.name)
        @diary.entries.each { |entry|
          if entry.contents.include?(contact.name)
            current_phonenumber = entry.contents[/(?<!\d)\d{11}(?!\d)/]
            names_and_numbers[contact.name.to_sym] = current_phonenumber
          end
        }
      end
    }
    return names_and_numbers
    # returns a hash of name keys from contacts and number values from diary
  end
end


new_contact_list = ContactList.new
contact_1 = Contact.new("Dave")
contact_2 = Contact.new("Mary")
new_contact_list.add(contact_1)
new_contact_list.add(contact_2)
diary = Diary.new
friday = DiaryEntry.new("Friday", "I met Dave, 07845123123 is her number.")
saturday = DiaryEntry.new("Saturday", "I went to the cinema and had a lovely time.")
sunday = DiaryEntry.new("Sunday", "Mary's phone number is 07854777666")
diary.add(friday)
diary.add(saturday)
diary.add(sunday)
phone_numbers = PhoneNumbers.new(diary, new_contact_list)
phone_numbers.contact_numbers
