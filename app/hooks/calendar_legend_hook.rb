module CalendarLegendHook
  class IncludeJavascriptHook < Redmine::Hook::ViewListener
    include ActionView::Helpers::TagHelper

    def view_layouts_base_html_head(context)
      javascript_tag("var calendar_events_daily_between = \"#{I18n.t('calendar_events_daily.between')}\";") +
       javascript_include_tag(:calendar_events_daily, plugin: 'redmine_calendar_events_daily')
    end
  end
end
