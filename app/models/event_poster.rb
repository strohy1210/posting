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

  def facebook
    @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], "http://localhost:3000/")
    token = @oauth.get_app_access_token
    @graph = Koala::Facebook::API.new('CAACEdEose0cBAOU7fa48N1RIinFDjmnaOmC61oHwtKvA5ZAdotsmmJHoALqaoi0DELURfkIrXTZBbjkTlzC1bG37XHnmxfIOBYs8NPx1qstZCOGXcZBlRUwmNigTdhmZCm5S8Mkt8IE46cQ0fhZAin2TNtbQHawtTyGV5ChZBGYcjTbi92WZCahq79hWODYgQIY46brgceZBFeLU0XGtw7b0UrNg1MlfbeMkZD') #add token here although it expires every hour
    @graph.put_object("me", "feed", :message => "writing on my wall with ruby!")
  end

  def insta

  end


end