class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed :registerable from devise to make new patient creation possible -SM

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  cattr_accessor :form_steps do 
    %w(basic payment contact)
  end
  
  attr_accessor :form_step

  validates :username, :first_name, :last_name, :address_1, :city, :state, :zip, :county, presence: true, if: -> { required_for_step?(:basic) }
  validates :payer, :payer_state, :transportation_type , presence: true, if: -> { required_for_step?(:payment) }
  validates :phone, :alternate_contact_name, :alternate_contact_phone, :alternate_contact_email, presence: true, if: -> { required_for_step?(:contact) }

  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, if: -> { required_for_step?(:basic) }
  validates :username, length: { minimum: 6, maximum: 15, message: "must be between 6-15 chracters" }, if: -> { required_for_step?(:basic) }
  validates :email, uniqueness: true, format: { with: /@/ }, if: -> { required_for_step?(:basic) }
  validates :first_name, :last_name, :city, :state, :address_1, :address_2, :county, length: { maximum: 25, message: "must be less than 25 characters" }, if: -> { required_for_step?(:basic) }
  validates :zip, length: { maximum: 15, message: "must be less than 15 characters" }, if: -> { required_for_step?(:basic) }
  validates :payer, :payer_state, length: { maximum: 15, message: "must be less than 15 chracters" }, if: -> { required_for_step?(:payment) }
  validates :payer_id, presence: { message: "ID can't be blank" }, if: -> { required_for_step?(:payment) }
  validates :payer_id, length: { maximum: 25, message: "ID must be less than 25 chracters" }, if: -> { required_for_step?(:payment) }
  validates :phone, :alternate_contact_phone, length: { maximum: 15, message: "must be less than 15 characters" }, if: -> { required_for_step?(:contact) }
  validates :alternate_contact_email, :alternate_contact_name, length: { maximum: 25, message: "must be less than 25 chracters" }, if: -> { required_for_step?(:contact) }
  validates :alternate_contact_email, format: { with: /@/ }, if: -> { required_for_step?(:contact) }


  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end

end
