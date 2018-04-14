class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :user_id, :null => false
      t.string  :title
      t.string  :section
      t.string  :location
      t.string  :access
      t.date    :date
      t.string  :start_time
      t.string  :end_time
      t.integer :cost
      t.integer :remaining
      t.integer :capacity
      t.integer :threshold
      t.string  :picture
      t.text    :explanation
      t.string  :positions, array: true
      t.string  :tags, array: true

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :date
    add_index :events, :section
    add_index :events, :tags
  end
end
