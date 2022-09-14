require 'projects_helper'

module RmlbProjectsHelperPatch
    extend ActiveSupport::Concern

    def project_settings_tabs
      tabs = super
      return tabs unless @project.module_enabled?(:redmine_member_location_board)

      tabs.tap { |t| t << append_rmlb_tab }.compact
    end

    def append_rmlb_tab
      @rmlb_setting = RmlbSetting.find_or_create(@project.id)
      action = { name: 'rmlb_settings',
                 controller: 'rmlb_settings',
                 action: :edit,
                 partial: 'rmlb_settings/show', label: :label_rmlb }
      return nil unless User.current.allowed_to?(action, @project)

      action
    end

end

ProjectsController.helper(RmlbProjectsHelperPatch)
