class RmlbLocationsController < ApplicationController
  unloadable
  before_filter :find_user, :find_project

  def initialize
    super()    #bodyˆÈŠO‚Íredmine view‚ðŒp³
    
    if Rails::VERSION::MAJOR < 3
      @base_url = Redmine::Utils::relative_url_root
    else
      @base_url = config.relative_url_root
    end
  end

  def index
    @rmlb_display_id = Setting.plugin_redmine_member_location_board['rmlb_display_id']
    @rmlb_priority_sort = Setting.plugin_redmine_member_location_board['rmlb_priority_sort']
    
    @rmlb_group_name_1 = Setting.plugin_redmine_member_location_board['rmlb_group_name_1']
    @rmlb_group_color_1 = Setting.plugin_redmine_member_location_board['rmlb_group_color_1']
    @rmlb_group_list_1 = Setting.plugin_redmine_member_location_board['rmlb_group_list_1'].split(/\r\n/)
    @rmlb_group_name_2 = Setting.plugin_redmine_member_location_board['rmlb_group_name_2']
    @rmlb_group_color_2 = Setting.plugin_redmine_member_location_board['rmlb_group_color_2']
    @rmlb_group_list_2 = Setting.plugin_redmine_member_location_board['rmlb_group_list_2'].split(/\r\n/)
    @rmlb_group_name_3 = Setting.plugin_redmine_member_location_board['rmlb_group_name_3']
    @rmlb_group_color_3 = Setting.plugin_redmine_member_location_board['rmlb_group_color_3']
    @rmlb_group_list_3 = Setting.plugin_redmine_member_location_board['rmlb_group_list_3'].split(/\r\n/)
    @rmlb_group_name_4 = Setting.plugin_redmine_member_location_board['rmlb_group_name_4']
    @rmlb_group_color_4 = Setting.plugin_redmine_member_location_board['rmlb_group_color_4']
    @rmlb_group_list_4 = Setting.plugin_redmine_member_location_board['rmlb_group_list_4'].split(/\r\n/)
    @rmlb_group_name_5 = Setting.plugin_redmine_member_location_board['rmlb_group_name_5']
    @rmlb_group_color_5 = Setting.plugin_redmine_member_location_board['rmlb_group_color_5']
    @rmlb_group_list_5 = Setting.plugin_redmine_member_location_board['rmlb_group_list_5'].split(/\r\n/)
    @rmlb_group_name_6 = Setting.plugin_redmine_member_location_board['rmlb_group_name_6']
    @rmlb_group_color_6 = Setting.plugin_redmine_member_location_board['rmlb_group_color_6']
    @rmlb_group_list_6 = Setting.plugin_redmine_member_location_board['rmlb_group_list_6'].split(/\r\n/)
    @rmlb_group_name_7 = Setting.plugin_redmine_member_location_board['rmlb_group_name_7']
    @rmlb_group_color_7 = Setting.plugin_redmine_member_location_board['rmlb_group_color_7']
    @rmlb_group_list_7 = Setting.plugin_redmine_member_location_board['rmlb_group_list_7'].split(/\r\n/)
    
    @user_is_manager = 0
    if User.current.allowed_to?(:edit_project, @project) or User.current.admin?
      @user_is_manager = 1
    end
    
    @user_current = User.current
    

    # @rmlb_projectusers = @project.assignable_users.sort_by{|u| u.login }
    
    @rmlb_location = RmlbLocation.find(@project.assignable_users.ids)
    
    #sort default
    @rmlb_location.sort_by!{|u| u.user.login }
    
    #sort option
    if @rmlb_priority_sort == 'true'
      @rmlb_location.sort_by!{|u| u.user_priority }
    end
    
    if params[:id].nil?
      @rmlb_location_edit = RmlbLocation.find_or_create(User.current.id)
    else
      @rmlb_location_edit = RmlbLocation.find(params[:id])
    end
  end
  
  def show
    index()
    render "index"
  end

  
  def update
    unless params[:rmlb_location].nil?
      aaa = RmlbLocation.find(params[:id])
      
      puts '------------------------------'
      puts params[:rmlb_location].to_a
      puts '------------------------------'
      
      aaa.update_attributes(params[:rmlb_location])
      aaa.color = aaa.location.rpartition(":")[0]
      aaa.location = aaa.location.rpartition(":")[2]
      
      if aaa.save
        flash[:notice] = l(:notice_successful_update)
        redirect_to project_rmlb_locations_path(:project => @project.name)
      else
        flash[:notice] = l(:rmlb_save_error)
        redirect_to project_rmlb_locations_path(:project => @project.name)
      end
    end
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
