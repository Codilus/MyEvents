class AddPropertiesToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string
    add_column :offers, :budget_price, :decimal
    add_column :offers, :budget_description, :text
  end
end
