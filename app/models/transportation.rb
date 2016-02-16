class Transportation < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :company_name, :address_1, :city, :state, :zip, :phone, :fax, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: "must contain @" }
  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6-15 characters" }
  validates :address_1, :address_2, :city, :state, length: { maximum: 25, message: "must be less than 25 characters" }
  validates :company_name, length: { maximum: 50, message: "must be less than 50 characters" }
  validates :zip, :phone, :fax, length: { maximum: 15, message: "must be less than 15 characters" }
end
