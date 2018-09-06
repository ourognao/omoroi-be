class AddInternalizationToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :explanation,    :explanation_jp
    add_column    :events, :explanation_en, :text
  end
end
