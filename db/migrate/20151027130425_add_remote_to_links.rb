class AddRemoteToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :remote, :boolean
  end
end
