class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :social_links, array: true
      t.string :emails, array: true
      t.string :phones, array: true
      t.json :addresses
      t.text :notes

      t.timestamps null: false
    end
  end
end
