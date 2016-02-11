class AddLimitsToAttributesInTransportations < ActiveRecord::Migration
  def change
    change_column :transportations, :username, :string, :limit => 25
    change_column :transportations, :email, :string
  end
end
