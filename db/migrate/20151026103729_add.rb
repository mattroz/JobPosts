class Add < ActiveRecord::Migration
  def change
  	add_column :links, :skill_id, :integer
  	add_column :links, :company_id, :integer
  	add_column :links, :industry_id, :integer
  	add_index :links, :skill_id
  	add_index :links, :industry_id
    add_index :links, :company_id
  end
end
