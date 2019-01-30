module RmlbProjectsHelperPatch
  extend ActiveSupport::Concern
  unloadable
  included do
    alias_method_chain(:project_settings_tabs, :rmlb)
  end

  def project_settings_tabs_with_rmlb
    tabs = project_settings_tabs_without_rmlb
    action = { name: 'rmlb_location',
               controller: 'rmlb_settings',
               action: 'edit',
               partial: 'rmlb_settings/show', label: :label_rmlb_location }
    tabs << action if User.current.allowed_to?(action, @project)
    tabs
  end
end

