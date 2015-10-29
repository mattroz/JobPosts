class AddCompensationToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :salary_min, :integer
  	add_column :links, :salary_max, :integer
  	add_column :links, :location, :string
  end
end
