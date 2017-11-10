class CreatePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :paths do |t|
      t.text :description
      t.integer :status
      t.string :observation
      t.belongs_to :breadcrumb, foreign_key: true

      t.timestamps
    end
  end
end
