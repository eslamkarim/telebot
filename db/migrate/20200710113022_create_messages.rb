class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message_id
      t.string :sender_id
      t.string :date
      t.string :text
    end
  end
end
