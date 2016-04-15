class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :type, inclusion: {:in => %w(Client Promoter)}
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :user_usages

  def name
    first_name + " " + last_name
  end

  def current_usage
    current_usage_found = get_usage(Time.now.month, Time.now.year)

    unless current_usage_found
      current_usage_found = user_usages.create!(month: Time.now.month, year: Time.now.year)
    end

    current_usage_found
  end

  def get_usage(month, year)
    user_usages.where(month: month, year: year).first
  end
end
