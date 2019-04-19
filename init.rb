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
            default: {
              'rmlb_display_id' => 'false',
              'rmlb_priority_sort' => 'false',
              'rmlb_group_name_1' => 'Location Group 1',
              'rmlb_group_list_1' => 'Set location \r\n as a list \r\n in the admin \r\n plugin setting field. \r\n Comma separated \r\n is not recognized',
               }
end