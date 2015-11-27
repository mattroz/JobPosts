class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.integer :link_id
      t.string :name
      t.string :resume_url
      t.string :coverletter_url

      t.timestamps null: false
    end
  end
end
