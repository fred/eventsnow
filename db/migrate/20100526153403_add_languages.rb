class AddLanguages < ActiveRecord::Migration
  def self.up
    # http://www.loc.gov/standards/iso639-2/php/code_list.php
    # Will use ISO 639-1 Code, 2 characters
    # eng => English
    # ara => Arabic
    add_column :events, :language, :string, :limit => 4, :default => "en"
    add_index  :events, :language
  end

  def self.down
    remove_column :events, :language
    remove_index  :events, :language
  end
end
