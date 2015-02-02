require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  #full_name
  test 'full_name shows first, last and nickname' do
    bob = Contact.new(first_name: 'Bob', last_name: 'Luthor', nickname: 'SuperSon')
    assert_equal "Bob 'SuperSon' Luthor", bob.full_name
  end

  test 'full_name when no nickname shows only first and last name' do
    george = Contact.new(first_name: 'George', last_name: 'Luthor')
    assert_equal "George Luthor", george.full_name
  end
end
