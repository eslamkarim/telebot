class AddLastNameToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :last_name, :string
  end
end
