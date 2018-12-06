class AddLocationNameToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_location_name_jp, :string
    add_column :events, :event_location_name_en, :string
  end
end
