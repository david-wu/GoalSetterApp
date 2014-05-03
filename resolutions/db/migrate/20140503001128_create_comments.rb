class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :sayable_id, null: false
      t.string :sayable_type, null: false

      t.timestamps
    end
  end
end
