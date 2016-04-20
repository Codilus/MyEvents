class AddLastSyncAtToUserUsages < ActiveRecord::Migration
  def change
    add_column :user_usages, :last_sync_at, :datetime
  end
end
