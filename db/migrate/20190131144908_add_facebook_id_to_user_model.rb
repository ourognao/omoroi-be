class AddFacebookIdToUserModel < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :facebook_id, :string, default: :nil
  end
end
