class Provider < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_many :patients
  has_many :rides, dependent: :destroy

  validates :username, presence: true
  #validates :username, :city, :state, :zip, :first_name, :last_name, :address_1, :county, :phone, :fax, presence: true
  validates :email, format: { with: /@/, message: "must contain @" }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6 and 15 characters" }
  #2016-04-19: Commented out so I can use signup form -SJD
  #validates :zip, :phone, :fax, length: { maximum: 15, message: "must be less than 15 characters" }
  #validates :city, :state, :address_1, :address_2, :county, length: { maximum: 25, message: "must been less than 25 characters" }
  #validates :facility_name, length: { maximum: 50, message: "must be less than 50 characters" }

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

end
