class ChangeUserAttributes < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password
    remove_column :users, :phoneNumber
    add_column :users, :login_token, :string
    add_column :users, :login_token_verified_at, :datetime
  end
end
