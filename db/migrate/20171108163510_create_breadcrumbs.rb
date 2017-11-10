class CreateBreadcrumbs < ActiveRecord::Migration[5.1]
  def change
    create_table :breadcrumbs do |t|
      t.string :name, limit: 255, null: false
      
      t.text :description
      
      t.integer :code
      t.integer :progress
      t.integer :user_created_id, null: false
      t.integer :user_tested_id, null: false

      t.timestamps
    end
  end
end
