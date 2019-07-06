class RmlbSetting < ActiveRecord::Base
  include Redmine::SafeAttributes
  belongs_to :project

  validates_uniqueness_of :project_id
  validates :project_id, presence: true
  

  def self.find_or_create(project_id)
    rmlb_setting = RmlbSetting.where(['project_id = ?', project_id]).first
    puts ' ====================== '
    
    unless rmlb_setting.present?
      rmlb_setting = RmlbSetting.new()
      rmlb_setting.attributes = { project_id: project_id }
      
      # Set default
      rmlb_setting.attributes = { rmlb_display_feeling: false }
      rmlb_setting.attributes = { rmlb_image_folder: '' }
      rmlb_setting.attributes = { rmlb_enable_global_group_1: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_2: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_3: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_4: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_5: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_6: true }
      rmlb_setting.attributes = { rmlb_enable_global_group_7: true }
      rmlb_setting.attributes = { rmlb_local_group_name_1: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_2: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_3: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_4: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_5: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_6: '' }
      rmlb_setting.attributes = { rmlb_local_group_name_7: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_1: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_2: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_3: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_4: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_5: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_6: '' }
      rmlb_setting.attributes = { rmlb_local_group_color_7: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_1: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_2: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_3: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_4: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_5: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_6: '' }
      rmlb_setting.attributes = { rmlb_local_group_list_7: '' }

            
      rmlb_setting.save!
    end
    rmlb_setting
  end

end
