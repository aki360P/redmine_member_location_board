class CreateTable < ActiveRecord::Migration
  def self.up
    create_table :rmlb_settings do |t|
      t.column :project_id, :integer
      t.column :custom_field_id_location, :integer
      t.column :custom_field_id_start, :integer
      t.column :custom_field_id_end, :integer
      t.column :custom_field_id_memo, :integer
      t.column :footer_message, :text
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rmlb_settings
  end
end
