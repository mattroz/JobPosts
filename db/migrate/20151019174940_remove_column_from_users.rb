class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :email
  	add_reference :users, :token, index: true
  end
end
