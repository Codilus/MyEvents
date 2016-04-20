class AddLastSyncProcessToUserUsages < ActiveRecord::Migration
  def change
    add_column :user_usages, :last_sync_process, :integer, default: 0
  end
end
