class AddColumn < ActiveRecord::Migration[4.2]
  #for redmine 3x,  class AddColumn < ActiveRecord::Migration
  #for redmine 4x,  class AddColumn < ActiveRecord::Migration[4.2]

  def self.up
    add_column :rmlb_locations, :feeling, :integer
  end

  def self.down
    remove_column :rmlb_locations, :feeling
  end
end
