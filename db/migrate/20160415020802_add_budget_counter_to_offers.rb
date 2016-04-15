class AddBudgetCounterToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :budget_counter, :integer, default: 0
  end
end
