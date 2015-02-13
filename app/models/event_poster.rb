class EventPoster

  def self.post_events(email)
    poster = EventPoster.new
    new_events = Event.where(posted: false)
    new_events.all.each do |event|
      poster.craigslist(event, email)
      poster.tweet(event)
      event.update(posted: true)
    end
#assumes all posts are successful- although bad input may inhibit post ability
  end

  def tweet(event)
    $twitter.update("#{event.title} happening on #{event.date} at #{event.address} - don't miss out!")
  end


  def craigslist(event, email)
    CapyClicker.craigslist(event, email)
  end

  # def tumblr(event, email, password)
    # CapyClicker.tumblr(event, email, password)
  # end

  # def facebook(page_id)
  #   @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], "http://localhost:3000/")
  #   @graph = Koala::Facebook::API.new(@oauth.get_app_access_token,  ENV['FACEBOOK_SECRET'])
  #   @graph.put_object("me", "feed", :message => "writing on my wall with ruby!")
  # end

# attempt at facebook posting
end