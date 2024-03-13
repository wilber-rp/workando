class ChangeChatColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :chatrooms, :name
    add_reference :chatrooms, :match, foreign_key: true
  end
end
