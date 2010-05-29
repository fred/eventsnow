class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :oganization
      t.string  :city
      t.string  :country
      t.string  :email
      t.string  :phone_number
      t.string  :mobile_number
      t.string  :user_ip
      t.string  :user_id
      t.text    :body
      t.boolean :unread, :default => true

      t.timestamps
    end
    add_index :messages, :unread
    add_index :messages, :user_id
  end

  def self.down
    drop_table :messages
  end
end
