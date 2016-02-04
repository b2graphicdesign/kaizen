class ChangePhoneAttributeTypeInPatients < ActiveRecord::Migration
  def change
    change_column :patients, :phone, :string, :limit => 15
  end
end
