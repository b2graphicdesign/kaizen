class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Removed :registerable from devise to make new patient creation possible -SM

  # devise :database_authenticatable, 
         # :recoverable, :rememberable, :trackable, :validatable

  cattr_accessor :form_steps do 
    %w(basic payment contact)
  end
  
  attr_accessor :form_step

  validates :email, :first_name, :last_name, :address_1, :city, :state, :county, presence: true, if: -> { required_for_step?(:basic) }
  validates :payer, :payer_id, :payer_state, :transportation_type , presence: true, if: -> { required_for_step?(:payment) }
  validates :phone, :alternate_contact_name, :alternate_contact_phone, :alternate_contact_email, presence: true, if: -> { required_for_step?(:contact) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end

end
