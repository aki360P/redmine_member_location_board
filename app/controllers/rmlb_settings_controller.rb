class RmlbSettingsController < ApplicationController
  unloadable
  before_filter :require_login, only: [:off]
  before_filter :find_user, :find_project, :authorize

  def initialize
    super()    #redmine‚Ìˆê”Ê•”(bodyˆÈŠO)‚ðŒp³
  end

  
  def edit
    unless params[:settings].nil?
      @rmlb_setting = RmlbSetting.find_or_create(@project.id)
      rmlb_setting_params = params[:settings]
      @rmlb_setting.update_attributes(rmlb_setting_params)
      @rmlb_setting.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to controller: 'projects',
                  action: 'settings', id: @project, tab: 'rmlb_location'
    end
    
  end
  
  def index
    
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
