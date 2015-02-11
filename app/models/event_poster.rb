class EventPoster

  def self.post_events
    poster = EventPoster.new
    poster.tweet
    Event.where(posted: false).each do |event|
      event.update(posted: true)
    end #assumes all posts are successful- although bad input may inhibit post ability
  end

  def tweet
    new_events = Event.where(posted: false)
    new_events.all.each do |event|
      $twitter.update("#{event.title} happening on #{event.date} at #{event.address} - don't miss out!")
    end
  end


end