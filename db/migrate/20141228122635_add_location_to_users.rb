class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, :null => true
  end
end
