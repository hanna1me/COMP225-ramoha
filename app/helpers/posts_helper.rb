module PostsHelper
  def event_countdown_text(event_date)
    days_until = (event_date.to_date - Date.current).to_i
    if days_until <=0
      "this event has passed!"
    elsif days_until > 30
      "in 30+ days!"
    else
      "in #{pluralize(days_until, 'day')}!"
    end
  end

  def format_date(event_date)
    if event_date != nil
      event_date.strftime("%B %d, %Y")
    else
      event_date
    end
  end
end
