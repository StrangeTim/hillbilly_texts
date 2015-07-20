class CorrectSpelling < ActiveRecord::Migration
  def change
    rename_column :contacts, :users_id, :user_id
  end
end
