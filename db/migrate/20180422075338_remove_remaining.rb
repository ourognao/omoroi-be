class RemoveRemaining < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :remaining, :integer
  end
end
