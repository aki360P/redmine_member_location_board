class CreateTable < ActiveRecord::Migration
  def self.up
    drop_table :rmlb_locations
    
    create_table :rmlb_locations, id: false, primary_key: :user_id  do |t|
      t.belongs_to :user
      t.column :user_id, :integer
      t.column :user_priority, :integer
      t.column :location, :string, :limit => 10
      t.column :color, :string, :limit => 10
      t.column :start_time, :string, :limit => 10
      t.column :end_time, :string, :limit => 10
      t.column :memo, :string, :limit => 30
      t.column :updated_on, :datetime
    end
    
    add_index :rmlb_locations, :user_id, unique: true
  end

  def self.down
    drop_table :rmlb_locations
  end
end
