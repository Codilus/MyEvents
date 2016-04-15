class AddProcessCounterToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :client_process_counter, :integer, default: 0
    add_column :offers, :promoter_process_counter, :integer, default: 0
  end
end
