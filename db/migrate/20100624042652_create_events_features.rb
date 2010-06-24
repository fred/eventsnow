class CreateEventsFeatures < ActiveRecord::Migration
  def self.up
    create_table :events_features, :id => false do |t|
      t.integer :event_id
      t.integer :feature_id
    end
    add_index :events_features, :event_id
    add_index :events_features, :feature_id
  end

  def self.down
    drop_table :events_features
  end
end
