class CreateMessageRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :message_rooms do |t|
      t.string :title
      t.string :blurb
      t.integer :creator_id

      t.timestamps
    end
  end
end
