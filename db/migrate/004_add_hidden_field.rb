class AddHiddenField < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x,  class AddColumn < ActiveRecord::Migration
  #for redmine 4x,  class AddColumn < ActiveRecord::Migration[4.2]

  def self.up
    add_column :rmlb_locations, :login, :string
    add_column :rmlb_locations, :name, :string
  end

  def self.down
    remove_column :rmlb_locations, :login
    remove_column :rmlb_locations, :name
  end
end
