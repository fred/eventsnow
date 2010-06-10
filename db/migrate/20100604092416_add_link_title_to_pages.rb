class AddLinkTitleToPages < ActiveRecord::Migration
  
  def self.up
    add_column :pages, :link_title, :string
  end

  def self.down
    remove_column :pages, :link_title
  end
  
end
