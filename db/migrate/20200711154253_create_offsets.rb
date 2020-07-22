class CreateOffsets < ActiveRecord::Migration[6.0]
  def change
    create_table :offsets do |t|
      t.string :bot_id
      t.integer :offset, default: 0
    end
  end
end
