class RecreateMessages < ActiveRecord::Migration
  def self.up
    say_with_time "Warning: Dropping old messages table..." do
      drop_table :messages
    end
    create_table :messages do |t|
      t.string :subject
      t.string :name
      t.string :email
      t.string :phone
      t.string :remote_ip
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
  
  def self.down
    drop_table :messages
  end
end
