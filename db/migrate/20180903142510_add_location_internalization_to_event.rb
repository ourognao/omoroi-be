class AddLocationInternalizationToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :location,    :location_jp
    add_column    :events, :location_en, :string
  end
end
