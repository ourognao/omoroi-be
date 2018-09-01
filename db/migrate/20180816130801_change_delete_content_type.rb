class ChangeDeleteContentType < ActiveRecord::Migration[5.1]
  def change
    remove_column :event_pictures, :filename, :string
    remove_column :event_pictures, :content_type, :string
  end
end
