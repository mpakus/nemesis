class AddColumnsToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :secret, :string
    add_column :accounts, :trello_username, :string
    add_column :accounts, :name, :string
    add_column :accounts, :email, :string
    add_column :accounts, :uid, :string, limit: 64
    add_index :accounts, :uid
  end
end
