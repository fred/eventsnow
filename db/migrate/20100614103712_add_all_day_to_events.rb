class AddAllDayToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :allday, :boolean, :default => false
  end

  def self.down
    remove_column :events, :allday
  end
end
