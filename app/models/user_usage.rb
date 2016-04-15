class UserUsage < ActiveRecord::Base
  belongs_to :user

  def increment_usage!
    increment(:process_usage).save!
  end
end
