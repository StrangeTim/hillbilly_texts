class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.string :phone_number
      t.string :text
      t.timestamps null: false
    end

    create_table :contacts_messages, id: false do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :message, index: true
    end
  end
end
