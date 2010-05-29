class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string    :title
      t.string    :phone_number
      t.text      :description
      t.text      :extra_description
      t.text      :location
      t.text      :cil_code
      t.text      :cil_code_mobile
      
      t.integer   :author_id
      t.integer   :speaker_type,    :default => 0
      t.integer   :speakers_count,  :default => 1
      t.integer   :maximum_users
      t.float     :price
      t.float     :lat, :default => nil
      t.float     :lng, :default => nil
      t.boolean   :show_map, :default => false
      
      t.boolean   :active,        :default => true
      t.boolean   :public_event,  :default => true
      t.boolean   :private_event, :default => false
      
      t.datetime  :start_date
      t.datetime  :end_date
      t.timestamps
    end
    
  end

  def self.down
    drop_table :events
  end
end
