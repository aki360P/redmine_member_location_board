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
    @rmlb_setting_location = Setting.plugin_redmine_member_location_board['rmlb_location'].split(/\r\n/)
    
    @user_is_manager = 0
    if User.current.allowed_to?(:edit_project, @project) 
      @user_is_manager = 1
    end
    
    @user_current = User.current

    @rmlb_projectusers = @project.assignable_users.sort_by{|u| u.login }
    
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
      aaa.save
        flash[:notice] = l(:notice_successful_update)
        redirect_to project_rmlb_locations_path(:project => @project.name)
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
