class RmlbSetting < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :project

  validates_uniqueness_of :project_id
  validates :project_id, presence: true
 
  attr_accessible :custom_field_id_location, :custom_field_id_start, :custom_field_id_end, :custom_field_id_memo
  attr_accessible :memo
  attr_accessible :footer_message



  def self.find_or_create(project_id)
    rmlb_setting = RmlbSetting.where(['project_id = ?', project_id]).first
    
    
    unless rmlb_setting.present?
      rmlb_setting =RmlbSetting.new
      rmlb_setting.project_id = project_id
      
      # Set default
      rmlb_setting.custom_field_id_location = '1'
      rmlb_setting.custom_field_id_start = '2'
      rmlb_setting.custom_field_id_end = '3'
      rmlb_setting.custom_field_id_memo = '4'
      rmlb_setting.footer_message = ''
            
      rmlb_setting.save!
    end
    rmlb_setting
  end

end
