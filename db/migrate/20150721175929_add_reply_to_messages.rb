class AddReplyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :reply, :boolean, default: false
  end
end
