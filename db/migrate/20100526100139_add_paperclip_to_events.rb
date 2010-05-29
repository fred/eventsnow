class AddPaperclipToEvents < ActiveRecord::Migration
    
  def self.up
    add_column :events, :document1_file_name,    :string
    add_column :events, :document1_content_type, :string
    add_column :events, :document1_file_size,    :integer
    add_column :events, :document1_updated_at,   :datetime
    
    add_column :events, :document2_file_name,    :string
    add_column :events, :document2_content_type, :string
    add_column :events, :document2_file_size,    :integer
    add_column :events, :document2_updated_at,   :datetime
    
    add_column :events, :document3_file_name,    :string
    add_column :events, :document3_content_type, :string
    add_column :events, :document3_file_size,    :integer
    add_column :events, :document3_updated_at,   :datetime
    
    add_column :events, :document4_file_name,    :string
    add_column :events, :document4_content_type, :string
    add_column :events, :document4_file_size,    :integer
    add_column :events, :document4_updated_at,   :datetime
    
    add_column :events, :document5_file_name,    :string
    add_column :events, :document5_content_type, :string
    add_column :events, :document5_file_size,    :integer
    add_column :events, :document5_updated_at,   :datetime
    
    add_column :events, :document6_file_name,    :string
    add_column :events, :document6_content_type, :string
    add_column :events, :document6_file_size,    :integer
    add_column :events, :document6_updated_at,   :datetime
  end

  def self.down
    remove_column :events, :document1_file_name
    remove_column :events, :document1_content_type
    remove_column :events, :document1_file_size
    remove_column :events, :document1_updated_at
    
    remove_column :events, :document2_file_name
    remove_column :events, :document2_content_type
    remove_column :events, :document2_file_size
    remove_column :events, :document2_updated_at
    
    remove_column :events, :document3_file_name
    remove_column :events, :document3_content_type
    remove_column :events, :document3_file_size
    remove_column :events, :document3_updated_at
    
    remove_column :events, :document4_file_name
    remove_column :events, :document4_content_type
    remove_column :events, :document4_file_size
    remove_column :events, :document4_updated_at
    
    remove_column :events, :document5_file_name
    remove_column :events, :document5_content_type
    remove_column :events, :document5_file_size
    remove_column :events, :document5_updated_at
    
    remove_column :events, :document6_file_name
    remove_column :events, :document6_content_type
    remove_column :events, :document6_file_size
    remove_column :events, :document6_updated_at
  end
  
end
