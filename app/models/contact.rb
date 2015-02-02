class Contact < ActiveRecord::Base
  paginates_per 30

  def full_name
    "#{first_name} '#{nickname}' #{last_name}".sub("'' ",'')
  end
end
