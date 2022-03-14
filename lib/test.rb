#require_relative 'phone_numbers'
require_relative 'diary'
require_relative 'contact_list'
require_relative 'contact'

class PhoneNumbers
  def initialize
  end

  def new_method
    return "hi"
  end
end

new = PhoneNumbers.new
p new.new_method