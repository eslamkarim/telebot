class AddBotIdToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :bot_id, :string
  end
end
