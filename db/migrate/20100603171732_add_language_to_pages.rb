class AddLanguageToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :language, :string, :default => "en"
  end

  def self.down
    remove_column :pages, :language
  end
end
