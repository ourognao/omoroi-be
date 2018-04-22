class UpdateEventSection < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :section, :string
    add_column :events, :section, :string, array: true
    change_column :events, :title, :text
  end
end
