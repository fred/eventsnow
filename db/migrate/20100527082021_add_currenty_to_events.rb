class AddCurrentyToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :currency, :string, :default => "USD"
  end

  def self.down
    remove_column :events, :currency
  end
end
