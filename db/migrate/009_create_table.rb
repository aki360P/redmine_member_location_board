class CreateTable < ActiveRecord::Migration
  def self.up
    create_table :rmlb_locations do |t|
      t.belongs_to :user
      t.column :user_id, :integer
      t.column :location, :string, :limit => 10
      t.column :start_time, :string, :limit => 10
      t.column :end_time, :string, :limit => 10
      t.column :memo, :string, :limit => 30
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rmlb_locations
  end
end
