class RmlbSettingsController < ApplicationController
  unloadable
  before_action :require_login
  before_action :find_user, :find_project, :authorize

  def initialize
    super()    #body表示を引き継ぐ
  end

  
  def edit
    unless params[:settings].nil?
      rmlb_setting = RmlbSetting.find_or_create(@project.id)
      
      rmlb_setting.update(rmlb_setting_params)
      rmlb_setting.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to controller: 'projects',
                  action: 'settings', id: @project, tab: 'rmlb_settings'
    end
    
  end
  
  def show
    
  end
  
  

  private

  def find_user
    @user = User.current
  end

  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
  
  def rmlb_setting_params
    params.require(:settings).permit('rmlb_display_feeling', 'rmlb_image_folder', 
      'rmlb_enable_global_group_1', 'rmlb_enable_global_group_2', 'rmlb_enable_global_group_3', 'rmlb_enable_global_group_4', 'rmlb_enable_global_group_5', 'rmlb_enable_global_group_6', 'rmlb_enable_global_group_7',
      'rmlb_local_group_name_1','rmlb_local_group_name_2','rmlb_local_group_name_3','rmlb_local_group_name_4','rmlb_local_group_name_5','rmlb_local_group_name_6','rmlb_local_group_name_7',
      'rmlb_local_group_color_1','rmlb_local_group_color_2','rmlb_local_group_color_3','rmlb_local_group_color_4','rmlb_local_group_color_5','rmlb_local_group_color_6','rmlb_local_group_color_7',
      'rmlb_local_group_list_1','rmlb_local_group_list_2','rmlb_local_group_list_3','rmlb_local_group_list_4','rmlb_local_group_list_5','rmlb_local_group_list_6','rmlb_local_group_list_7')
  end
end
