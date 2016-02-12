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

  validates :transport_id, :username, :first_name, :last_name, :address_1, :city, :state, :zip, :phone, :email, presence: true, if: -> { required_for_step?(:basic) }
  validates :insurance_company, :insurance_account, :drivers_license_state, :drivers_license_no, :drivers_license_expiry, presence: true, if: -> { required_for_step?(:payment) }
  validates :vehicle_year, :vehicle_make, :vehicle_model, :vehicle_type, :vehicle_color, :vehicle_license_plate, :vehicle_registration_expiry, presence: true, if: -> { required_for_step?(:contact) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
end
