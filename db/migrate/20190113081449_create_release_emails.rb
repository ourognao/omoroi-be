class CreateReleaseEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :release_emails do |t|
      t.column		:email, :string
      t.timestamps
    end
  end
end
