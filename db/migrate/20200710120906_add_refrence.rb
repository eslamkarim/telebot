class AddRefrence < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :chat, foreign_key: true
  end
end
