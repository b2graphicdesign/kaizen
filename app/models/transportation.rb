class Transportation < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_many :drivers
  has_many :rides, dependent: :destroy

  validates :username, :company_name, :address_1, :city, :state, :zip, :phone, presence: true
  validates :email, format: { with: /@/, message: "must contain @" }
  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6-15 characters" }
  validates :address_1, :address_2, :city, :state, length: { maximum: 25, message: "must be less than 25 characters" }
  validates :company_name, length: { maximum: 50, message: "must be less than 50 characters" }
  validates :zip, :phone, length: { maximum: 15, message: "must be less than 15 characters" }

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

end
