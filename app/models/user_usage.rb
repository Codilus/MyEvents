class UserUsage < ActiveRecord::Base
  belongs_to :user

  def increment_usage!
    increment(:process_usage).save!
  end

  def mark_sync!
    self.last_sync_at = Time.now
    self.last_sync_process = process_usage
    save!
  end

  def process_since_sync
    process_usage - last_sync_process
  end
end
