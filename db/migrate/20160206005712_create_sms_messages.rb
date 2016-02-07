class CreateSmsMessages < ActiveRecord::Migration
  def change
    create_table :sms_messages do |t|
      t.string :to, limit: 12
      t.string :from, limit: 12
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
