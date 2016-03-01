class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  attr_accessor :username

  validates :email, presence: true, uniqueness: true, format: { with: /@/, message: "must contain @" }
  validates :username, presence: true, uniqueness: {case_sensitve: false}, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be 6-15 characters" }

  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
    if login = conditions.delete(:username)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

end
