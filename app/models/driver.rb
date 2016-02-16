class Driver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed :registerable from devise to make new patient creation possible -SM

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  cattr_accessor :form_steps do
    %w(contact licensing vehicle)
  end

  attr_accessor :form_step

  validates :username, :first_name, :last_name, :address_1, :city, :state, :zip, :phone, presence: true, if: -> { required_for_step?(:contact) }
  validates :insurance_company, :insurance_account, :drivers_license_state, :drivers_license_no, :drivers_license_expiry, presence: true, if: -> { required_for_step?(:licensing) }
  validates :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_type, :vehicle_color, :vehicle_license_plate, :vehicle_registration_expiry, presence: true, if: -> { required_for_step?(:vehicle) }

  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, if: -> { required_for_step?(:contact) }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6-15 characters" }, if: -> { required_for_step?(:contact) }
  validates :email, uniqueness: true, format: { with: /@/ }, if: -> { required_for_step?(:contact) }
  validates transport_id, presence: { message: "ID can't be blank" }, if: -> { required_for_step?(:contact) }
  validates :first_name, :last_name, :address_1, :address_2, :city, :state, length: { maximum: 25, message: "must be less than 25 characters" }, if: -> { required_for_step?(:contact) }
  validates :zip, :phone, length: { maximum: 15, message: "must be less than 15 characters" }, if: -> { required_for_step?(:contact) }
  validates :insurance_company, :insurance_account, length: { maximum: 50, message: "must be less than 50 characters" }, if: -> { required_for_step?(:licensing) }
  validates :drivers_license_state, :drivers_license_no, length: { maximum: 25, message: "must be less than 25 characters" }, if: -> { required_for_step?(:licensing) }
  validates :vehicle_make, :vehicle_model, :vehicle_type, :vehicle_color, length: { maximum: 25, message: "must be less than 25 characters" }, if: -> { required_for_step?(:vehicle) }
  validates :vehicle_license_plate, length: { maximum: 10, message: "must be less than 10 characters" }, if: -> { required_for_step?(:vehicle) }



  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
end
