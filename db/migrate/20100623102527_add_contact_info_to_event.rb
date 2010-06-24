class AddContactInfoToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :sponsor_email, :string
    add_column :events, :sponsor_name,  :string
  end

  def self.down
    remove_column :events, :sponsor_email
    remove_column :events, :sponsor_name
  end
end
