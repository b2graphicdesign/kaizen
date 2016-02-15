class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, length: { minimum: 6, message: "6 characters it the minimum allowed" }
  validates :username, length: { maximum: 15, message: "15 characters is the maximum allowed" }
end
