class AddIsAuthenticatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_authenticated, :boolean
  end
end
