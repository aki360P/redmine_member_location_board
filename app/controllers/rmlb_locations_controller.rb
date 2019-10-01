class RmlbLocationsController < ApplicationController
  unloadable
  before_action :find_user, :find_project
  before_action :load_config
  before_action :authorize
  accept_api_auth :index, :edit


  def initialize
    super()    #body表示を引き継ぐ
  end

  def index
      @rmlb_locations = RmlbLocation.find(@project.users.ids)
      #@rmlb_location_edit = RmlbLocation.find(User.current.id)


    @rmlb_groups = Principal.member_of(@project).where(['type = ?','Group'])
    @rmlb_group_member_arry = []
    unless @rmlb_groups.nil?
      @rmlb_groups.each do |i|
        @rmlb_group_member_arry.push(Group.find(i.id).users.ids)
      end
    end
    arry1 = @project.users.ids
    arry2 = @rmlb_group_member_arry.flatten
    arry3 = arry1 - arry2
    @rmlb_group_member_arry.push(arry3)
    
    #sort default
    @rmlb_locations.sort_by!{|u| u.user.login }
    
    #sort option
    if @rmlb_priority_sort == 'true'
      @rmlb_locations.sort_by!{|u| u.user_priority }
    end
    

    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @rmlb_locations }
      format.json { render :json => @rmlb_locations }
    end
  end
  
  def show
    @rmlb_location_edit = RmlbLocation.find_or_create(params[:id])
  end

  def edit
    @rmlb_location_edit = RmlbLocation.find_or_create(params[:id])
    render :partial => 'edit'
    #render :partial => 'edit', :locals => { :rmlb_location_edit => @rmlb_location_edit }
  end
  
  def update
    return if params[:rmlb_location].nil?

      aaa = RmlbLocation.find(params[:id])
      
      aaa.update(rmlb_location_params)
      aaa.attributes = { color: aaa.location.rpartition(":")[0], location: aaa.location.rpartition(":")[2] }
      
      aaa.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to project_rmlb_locations_path(:project => @project.name)

  end

  def multiupdate
    return if params[:rmlb_location].nil?

      aaa = RmlbLocation.where("user_id = ?", [1, 5])
      aaa.attribute(rmlb_location_param)
      aaa.save
      
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
  
  def rmlb_location_params
    params.require(:rmlb_location).permit('user_priority', 'location', 'color', 'start_time', 'end_time', 'memo', 'feeling')
  end

  def rmlb_location_param
    params.require(:rmlb_location).permit('location')
  end
  
  def load_config
    RmlbLocation.create_all(@project.users.ids)

    if Setting.plugin_redmine_member_location_board.nil?
      redirect_to plugin_settings_path(:id => :redmine_member_location_board)
    else
      @rmlb_display_id = Setting.plugin_redmine_member_location_board['rmlb_display_id']
      @rmlb_priority_sort = Setting.plugin_redmine_member_location_board['rmlb_priority_sort']
      #@rmlb_display_feeling = Setting.plugin_redmine_member_location_board['rmlb_display_feeling']
      
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

      @rmlb_setting = RmlbSetting.find_or_create(@project.id)
      @rmlb_local_gruop_lsit_1 = @rmlb_setting.rmlb_local_group_list_1.split(/\r\n/)
      @rmlb_local_gruop_lsit_2 = @rmlb_setting.rmlb_local_group_list_2.split(/\r\n/)
      @rmlb_local_gruop_lsit_3 = @rmlb_setting.rmlb_local_group_list_3.split(/\r\n/)
      @rmlb_local_gruop_lsit_4 = @rmlb_setting.rmlb_local_group_list_4.split(/\r\n/)
      @rmlb_local_gruop_lsit_5 = @rmlb_setting.rmlb_local_group_list_5.split(/\r\n/)
      @rmlb_local_gruop_lsit_6 = @rmlb_setting.rmlb_local_group_list_6.split(/\r\n/)
      @rmlb_local_gruop_lsit_7 = @rmlb_setting.rmlb_local_group_list_7.split(/\r\n/)

      @user_current = User.current
      @user_is_manager = 0
      if User.current.allowed_to?(:edit_project, @project) or User.current.admin?
        @user_is_manager = 1
      end

    end
  end


end
