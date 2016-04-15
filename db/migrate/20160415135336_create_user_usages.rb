class CreateUserUsages < ActiveRecord::Migration
  def change
    create_table :user_usages do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :process_usage, default: 0, null: false
      t.integer :month, null: false
      t.integer :year, null: false
    end
  end
end
