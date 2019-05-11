require 'redmine'

Redmine::Plugin.register :redmine_member_location_board do
  name 'Redmine Member Location Board plugin'
  author 'Akinori Iwasaki'
  description 'Provides a member location board'
  version '1.0.1'
  url 'https://github.com/aki360P/redmine_member_location_board'
  
  project_module :redmine_member_location_board do
    permission :rmlb_location_view, :rmlb_locations => [:index, :show]
    permission :rmlb_location_edit, :rmlb_locations => [:update]
  end
  
  
  # add tab - project module
  menu :project_menu, :rmlb_locations, {:controller => 'rmlb_locations', :action => 'index' }, :caption => :label_rmlb, :param => :project_id
  
  
  # setting
  settings  partial: 'rmlb_settings/show',
            default: {
              'rmlb_display_id' => 'false',
              'rmlb_priority_sort' => 'false',
              'rmlb_group_name_1' => 'Location Group 1',
              'rmlb_group_name_2' => '',
              'rmlb_group_name_3' => '',
              'rmlb_group_name_4' => '',
              'rmlb_group_name_5' => '',
              'rmlb_group_name_6' => '',
              'rmlb_group_name_7' => '',
              'rmlb_group_color_1' => '',
              'rmlb_group_color_2' => '',
              'rmlb_group_color_3' => '',
              'rmlb_group_color_4' => '',
              'rmlb_group_color_5' => '',
              'rmlb_group_color_6' => '',
              'rmlb_group_color_7' => '',
              'rmlb_group_list_1' => 'Set location as a list in the admin plugin setting field. Comma separated is not recognized.',
              'rmlb_group_list_2' => '',
              'rmlb_group_list_3' => '',
              'rmlb_group_list_4' => '',
              'rmlb_group_list_5' => '',
              'rmlb_group_list_6' => '',
              'rmlb_group_list_7' => ''
               }
end