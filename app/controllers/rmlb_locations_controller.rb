class RmlbLocationsController < ApplicationController
  unloadable
  before_filter :find_user, :find_project

  def initialize
    super()    #body以外はredmine viewを継承
    
    if Rails::VERSION::MAJOR < 3
      @base_url = Redmine::Utils::relative_url_root
    else
      @base_url = config.relative_url_root
    end
  end

  def index
    #設定されたテーブルを読み込み
    @rmlb_setting = RmlbSetting.find_by(project_id: @project.id)
    @rmlb_location = CustomField.find_by_id(@rmlb_setting.custom_field_id_location).possible_values
    @rmlb_star_time = CustomField.find_by_id(@rmlb_setting.custom_field_id_start).possible_values
    @rmlb_end_time =  CustomField.find_by_id(@rmlb_setting.custom_field_id_end).possible_values
    @rmlb_memo = CustomField.find_by_id(@rmlb_setting.custom_field_id_memo)
    
    @user_is_manager = 0
    if User.current.allowed_to?(:edit_project, @project) 
      @user_is_manager = 1
    end
    
    @assignable_users = @project.assignable_users
    
    @api_key = User.current.api_key
    unless User.current.allowed_to?(:view_issues, @project)
      render_403
    end
    
    @user_can_add = User.current.allowed_to?(:add_issues, @project)
    @user_can_edit = User.current.allowed_to?(:edit_issues, @project)
    @user_can_delete = User.current.allowed_to?(:delete_issues, @project)
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
  
  
end
