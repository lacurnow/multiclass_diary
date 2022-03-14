class ContactList
  def initialize
    @contacts = []
  end

  def add(contact) # contact is an instance of contact
    @contacts << contact
  end

  def all_contacts
    return @contacts
  end
end