class CreateSettingTable < ActiveRecord::CompatibleLegacyMigration.migration_class
  #for redmine 3x,  class CreateTable < ActiveRecord::Migration
  #for redmine 4x,  class CreateTable < ActiveRecord::Migration[4.2]
  
  def self.up
    create_table :rmlb_settings do |t|
      t.column :project_id, :integer
      t.column :rmlb_display_feeling, :boolean
      t.column :rmlb_image_folder, :string
      t.column :rmlb_enable_global_group_1, :boolean
      t.column :rmlb_enable_global_group_2, :boolean
      t.column :rmlb_enable_global_group_3, :boolean
      t.column :rmlb_enable_global_group_4, :boolean
      t.column :rmlb_enable_global_group_5, :boolean
      t.column :rmlb_enable_global_group_6, :boolean
      t.column :rmlb_enable_global_group_7, :boolean
      t.column :rmlb_local_group_name_1, :string
      t.column :rmlb_local_group_name_2, :string
      t.column :rmlb_local_group_name_3, :string
      t.column :rmlb_local_group_name_4, :string
      t.column :rmlb_local_group_name_5, :string
      t.column :rmlb_local_group_name_6, :string
      t.column :rmlb_local_group_name_7, :string
      t.column :rmlb_local_group_color_1, :string
      t.column :rmlb_local_group_color_2, :string
      t.column :rmlb_local_group_color_3, :string
      t.column :rmlb_local_group_color_4, :string
      t.column :rmlb_local_group_color_5, :string
      t.column :rmlb_local_group_color_6, :string
      t.column :rmlb_local_group_color_7, :string
      t.column :rmlb_local_group_list_1, :string
      t.column :rmlb_local_group_list_2, :string
      t.column :rmlb_local_group_list_3, :string
      t.column :rmlb_local_group_list_4, :string
      t.column :rmlb_local_group_list_5, :string
      t.column :rmlb_local_group_list_6, :string
      t.column :rmlb_local_group_list_7, :string
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rmlb_settings
  end
end
