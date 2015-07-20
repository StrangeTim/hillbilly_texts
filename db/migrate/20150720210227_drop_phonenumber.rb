class DropPhonenumber < ActiveRecord::Migration
  def change
    remove_column :messages, :phone_number, :string
  end
end
