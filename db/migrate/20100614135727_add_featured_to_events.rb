class AddFeaturedToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :events, :featured
  end
end
