class AddIndexesToEvents < ActiveRecord::Migration
  def self.up
    add_index   :events, :author_id
    add_index   :events, :speaker_type
    add_index   :events, :speakers_count
    add_index   :events, :active
    add_index   :events, :public_event
    add_index   :events, :private_event
  end

  def self.down
    remove_index   :events, :author_id
    remove_index   :events, :speaker_type
    remove_index   :events, :speakers_count
    remove_index   :events, :active
    remove_index   :events, :public_event
    remove_index   :events, :private_event
  end
end
