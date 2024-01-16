module CalendarEventsDaily
  module CalendarHelperPatch
    def initialize(date, lang = current_language, period = :month)
      super
      @events_by_days = Hash.new {|h,k| h[k] = [] }
    end

    def events=(events)
      super
      @events.each do |event|
        next if event.start_date.nil? || event.due_date.nil?
        (event.start_date..event.due_date).each do |d|
          @events_by_days[d] << event
        end
      end
    end
    def events_on(day)
      ((@events_by_days[day] || []) + (@ending_events_by_days[day] || []) + (@starting_events_by_days[day] || [])).uniq
    end
  end
end
