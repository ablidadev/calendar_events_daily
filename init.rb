Redmine::Plugin.register :calendar_events_daily do
  name 'Calendar Events Daily plugin'
  author 'bokos'
  description 'Show issues on days between end and start date in calendar'
  version '0.0.1'
  url 'https://github.com/bokos/redmine_calendar_events_daily'

  RedmineApp::Application.config.after_initialize do
    Redmine::Helpers::Calendar.prepend CalendarEventsDaily::CalendarHelperPatch
  end
end
