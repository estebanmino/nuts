class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :address, index: true, foreign_key: true
      t.string :email
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
