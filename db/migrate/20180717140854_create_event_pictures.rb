class CreateEventPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :event_pictures do |t|
      t.column :event_id,     :integer
      t.column :filename,     :string
      t.column :content_type, :string
      t.column :data,         :binary
      
      t.timestamps
    end
  end
end
