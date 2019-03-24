require 'redmine'

Redmine::Plugin.register :redmine_member_location_board do
  name 'Redmine Member Location Board plugin'
  author 'Akinori Iwasaki'
  description 'Provides a member location board'
  version '0.3.0'
  url 'https://github.com/aki360P/redmine_member_location_board'
  
  project_module :redmine_member_location_board do
    permission :rmlb_location_view, :rmlb_locations => 'index', :public => true
    permission :rmlb_location_edit, :rmlb_locations => 'update',  :require=>:member
  end
  
  
  # add tab - project module
  menu :project_menu, :rmlb_locations, {:controller => 'rmlb_locations', :action => 'index' }, :caption => :label_rmlb, :param => :project_id
  
  
  # setting
  settings  partial: 'rmlb_settings/show',
            default: { 'rmlb_location' => 'Set location as a list in the admin plugin setting field. Comma separated is not recognized as a list' }
end