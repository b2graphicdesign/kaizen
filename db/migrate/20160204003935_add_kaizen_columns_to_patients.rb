class AddKaizenColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :username, :string, :limit => 15
    add_column :patients, :provider_id, :integer
    add_column :patients, :address_1, :string, :limit => 25
    add_column :patients, :address_2, :string, :limit => 25
    add_column :patients, :county, :string, :limit => 25
    add_column :patients, :address_notes, :text
    add_column :patients, :alternate_contact_name, :string, :limit => 25
    add_column :patients, :alternate_contact_phone, :string, :limit => 15
    add_column :patients, :alternate_contact_email, :string, :limit => 25
    add_column :patients, :alert_call, :boolean
    add_column :patients, :alert_sms, :boolean
    add_column :patients, :alert_email, :boolean
    add_column :patients, :alert_alternate_call, :boolean
    add_column :patients, :alert_alternate_sms, :boolean
    add_column :patients, :alert_alternate_email, :boolean
    add_column :patients, :payer, :string, :limit => 15
    add_column :patients, :payer_state, :string, :limit => 15
    add_column :patients, :payer_id, :string, :limit => 25
    add_column :patients, :transportation_type, :string
    add_column :patients, :assistance_notes, :text
    add_column :patients, :comments, :text
  end
end
