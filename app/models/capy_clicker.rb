class CapyClicker

  def self.start_session#(email, day, week, month),duration
    session = Capybara::Session.new(:selenium)
    session.visit "https://post.craigslist.org/k/4j7xOMGy5BGOR8l9hwUycA/h5DL0?s=edit"
    session.fill_in 'FromEMail', :with=>'strohsm88@gmail.com'
    session.fill_in 'ConfirmEMail', :with=>'strohsm88@gmail.com'
    session.find(".start .label select option[value='4']").click #put dynamic number in for value
    session.fill_in 'eventStartDay', :with=>8
    session.find(".std select option[value='8']").click
    session.fill_in 'postingTitle', :with=>event.title
    session.fill_in 'GeographicArea', :with=>event.city
    session.fill_in 'postal_code', :with=>event.zipcode
    session.fill_in 'PostingBody', :with=>event.description
    session.fill_in 'xstreet0', :with=>event.street
    session.fill_in 'city', :with=>event.city
    session.fill_in 'region', :with=>"NY"
    session.find('.bigbutton').click_link_or_button

  end

  def self.tumbl(email, password)
    session = Capybara::Session.new(:selenium)
    session.visit "https://www.tumblr.com/blog/strohy1210/new/text"
    session.fill_in 'signup_email', :with=>email
    session.fill_in 'signup_password', :with=>password
    session.find("#signup_forms_submit").click
    session.find(".title-field").click
    session.execute_script('jQuery(".title-field .editor-placeholder").text("")')
    session.execute_script('jQuery(".title-field .editor").text("the title!!!!")')
    session.find('.editor-richtext').click
    session.execute_script("jQuery('.editor-richtext p').text('sup!!')")
    session.find('.editor-richtext').click
    session.execute_script('jQuery(".create_post_button").removeAttr("disabled")')
    session.find('.create_post_button').click_link_or_button
    session.execute_script('jQuery(".create_post_button").click()')
 # session.find(".start .label select option[value='4']").click
    #you can click on the button but then it closes without saving and there's no form element
  end


end