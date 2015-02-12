class CapyClicker

  def self.start_session
    session = Capybara::Session.new(:selenium)
    session.visit "https://post.craigslist.org/k/4j7xOMGy5BGOR8l9hwUycA/h5DL0?s=edit"
    session.fill_in 'FromEMail', :with=>'strohsm88@gmail.com'
    session.fill_in 'ConfirmEMail', :with=>'strohsm88@gmail.com'
    session.find(".start .label select option[value='4']").click #put dynamic number in for value
    session.first('input[value="8"]').click
  end

  def self.tumbl(email, password)
    session = Capybara::Session.new(:selenium)
    session.visit "https://www.tumblr.com/blog/strohy1210/new/text"
    session.fill_in 'signup_email', :with=>'strohsm88@gmail.com'
    session.fill_in 'signup_email', :with=>'88wYgdwatj'
    session.find("#signup_forms_submit").click
    session.find(".title-field").click
    session.execute_script('jQuery(".title-field .editor").text("this is the title")')
    session.find('.editor-richtext').click
    session.execute_script("jQuery('.editor-richtext').text('sup')")
    session.find(".create_post_button").click
  end


end