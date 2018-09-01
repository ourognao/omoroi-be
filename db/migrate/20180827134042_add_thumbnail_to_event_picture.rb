class AddThumbnailToEventPicture < ActiveRecord::Migration[5.1]
  def change
    rename_column :event_pictures, :data, :original
    add_column    :event_pictures, :thumbnail, :text
  end
end
