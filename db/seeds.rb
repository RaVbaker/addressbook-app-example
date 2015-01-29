# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COMMON_SOCIAL_SITES = %w{http://facebook.com/ http://twitter.com/ http://linkedin.com/in/ http://vimeo.com/  http://plus.google.com/+}

Contact.delete_all
Contact.connection.execute("ALTER SEQUENCE #{Contact.table_name}_id_seq RESTART WITH 1")

25_000.times do |n|
  nickname = Faker::Internet.user_name if rand(100) < 15
  social_links = COMMON_SOCIAL_SITES.take(rand(COMMON_SOCIAL_SITES.size+1)).map {|url| url+nickname } if nickname.present?

  Contact.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: nickname,
    social_links: social_links,
    emails: Math.sqrt(rand(7)+1).round.times.map { Faker::Internet.free_email(nickname) },
    phones: Math.sqrt(rand(7)+1).round.times.map { Faker::PhoneNumber.cell_phone },
    notes: (Faker::Lorem.sentence(10) if rand(5) < 3),
    addresses: Math.sqrt(rand(7)+1).round.times.map {
      {
        street_name: Faker::Address.street_name,
        street_number: (rand(120)+1),
        postcode: Faker::Address.postcode,
        city: Faker::Address.city,
        country: Faker::Address.country,
      }
    }
  )
end
