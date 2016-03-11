class AddNumberOfGuestsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :number_of_guests, :integer
  end
end
