class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :photo_id
      t.integer :user_id
      t.integer :budtender_id

      t.timestamps

    end
  end
end
