class AddResetPasswordTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password_token, :string
  end
end
