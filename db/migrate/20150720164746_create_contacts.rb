class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.belongs_to :users, index: true
    end
  end
end
