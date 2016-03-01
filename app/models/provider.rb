class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :patients
  has_many :rides

  validates :username, :city, :state, :zip, :facility_name, :address_1, :county, :address_notes, :phone, :fax, presence: true
  validates :email, format: { with: /@/, message: "must contain @" }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6 and 15 characters" }
  validates :zip, :phone, :fax, length: { maximum: 15, message: "must be less than 15 characters" }
  validates :city, :state, :address_1, :address_2, :county, length: { maximum: 25, message: "must been less than 25 characters" }
  validates :facility_name, length: { maximum: 50, message: "must be less than 50 characters" }
end
