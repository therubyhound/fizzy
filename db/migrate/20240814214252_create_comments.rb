class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :creator_id, null: false
      t.integer :splat_id, null: false

      t.timestamps
    end
  end
end
