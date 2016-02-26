class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :event, index: true, foreign_key: true
      t.references :promoter, index: true

      t.timestamps null: false
    end
    add_foreign_key :offers, :users, column: :promoter_id
  end
end
