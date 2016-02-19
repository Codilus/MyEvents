class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :type, inclusion: {:in => %w(Client)}
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    first_name + " " + last_name
  end
end
