class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.datetime :created_at
      t.datetime :updated_at
      t.string :slug
      t.integer :user_id
      t.string :experience
      t.string :hours 
      t.string :description

      t.timestamps null: false
    end

    add_index :links, :slug
    add_index :links, :user_id
  end

  # industry_id, skills_id
end
