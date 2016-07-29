class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :number
      t.string :email
      t.string :commune
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
