class AddOauthFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    change_column :users, :phone, :string
  end
end
