class CreateReservation < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :event_id, :null => false
      t.integer :user_id,  :null => false
      t.integer :expected_people

      t.timestamps
    end

    add_index :reservations, :event_id
    add_index :reservations, :user_id
  end
end
