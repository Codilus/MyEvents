class AddBudgetCounterToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :budget_counter, :integer
  end
end
