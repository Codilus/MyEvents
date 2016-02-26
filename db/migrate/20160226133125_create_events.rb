class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :client, index: true, null: false

      t.timestamps
    end
    add_foreign_key :events, :users, column: :client_id
  end
end
