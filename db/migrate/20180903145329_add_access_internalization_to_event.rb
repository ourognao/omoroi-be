class AddAccessInternalizationToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :access,    :access_jp
    add_column    :events, :access_en, :string
  end
end
