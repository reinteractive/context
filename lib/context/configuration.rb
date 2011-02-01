require 'singleton'
module Context
# Holds the configuration values for the Context engine.
#
#  Context::Configuration.page_show_template_path (default nil)
#    Set to the path of the template to use for Pages#show actions.
#    If nil, context simply renders the Page within the required layout.
#
#  Context::Configuration.page_show_layout (default true)
#    Set to the default layout that should be used for Pages#show actions.
#    The default will cause the "application" layout to be rendered.
#    NOTE: This can be changed by the Page subclass, and is used in preference to this setting.
module Configuration
  extend self

  def page_show_template_path
    @page_show_template_path ||= nil
  end
  def page_show_template_path=(val)
    @page_show_template_path=val
  end

  def page_show_layout
    @page_show_layout ||= true
  end
  def page_show_layout=(val)
    @page_show_layout=val
  end
end
end
