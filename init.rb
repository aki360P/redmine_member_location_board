
Redmine::Plugin.register :redmine_member_location_board do
  name 'Redmine Member Location Board plugin'
  author 'Akinori Iwasaki'
  description 'Provides a member location board'
  version '0.1.1'
  url 'https://github.com/aki360P/redmine_member_location_board'
  
  project_module :redmine_member_location_board do
    permission :rmlb_location, :rmlb_locations => 'index'
    permission :rmlb_setting, :rmlb_settings => 'edit'
  end
  
  
  # add tab - project module
  menu :project_menu, :rmlb_locations, {:controller => 'rmlb_locations', :action => 'index' }, :caption => :label_rmlb_location, :param => :project_id
  
  
  # add tab - project module setting
  Rails.configuration.to_prepare do
    require_dependency 'rmlb_projects_helper_patch'
    unless ProjectsHelper.included_modules.include?(RmlbProjectsHelperPatch)
      ProjectsHelper.send(:include, RmlbProjectsHelperPatch)
    end
  end
  
  
end