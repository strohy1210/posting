class CapyClicker

  def self.craigslist(event, email)#(email, day, week, month),duration
    day = event.date.split("-").second
    month = event.date.split("-").first
    zipcode =event.zipcode
    session = Capybara::Session.new(:selenium)
    session.visit "https://post.craigslist.org/k/2D9yDpuz5BGvDAgjylD_TA/Wcwzq?s=hood"
    session.execute_script("$('big').siblings().click()")
    session.fill_in 'FromEMail', :with=>'strohsm88@gmail.com'
    session.fill_in 'ConfirmEMail', :with=>'strohsm88@gmail.com' 
    session.find(".start .label select option[value='"+month+"']").click
    # session.select month, :from => 'eventStartMonth'#put dynamic number in for value
    session.fill_in 'eventStartDay', :with=>day
    session.find(".std select option[value='"+event.duration+"']").click
    session.fill_in 'PostingTitle', :with=> event.title
    session.fill_in 'GeographicArea', :with=> 'New York'
    session.fill_in 'postal_code', :with=> zipcode
    session.fill_in 'PostingBody', :with=> event.description
    session.fill_in 'xstreet0', :with=> event.street
    session.fill_in 'city', :with=>'New York'
    session.fill_in 'region', :with=>"NY"
    session.find('.bigbutton').click
    session.find('.button').click
  end

  def self.tumbl(email, password)
    session = Capybara::Session.new(:selenium)
    session.visit "https://www.tumblr.com/blog/strohy1210/new/text"
    session.fill_in 'signup_email', :with=>email
    session.fill_in 'signup_password', :with=>password
    session.find("#signup_forms_submit").click
    session.find(".title-field").click
    session.execute_script('jQuery(".title-field .editor-placeholder").text("");')
    session.execute_script('jQuery(".title-field .editor").text("the title!!!!");')
    session.find('.editor-richtext').click
    session.execute_script("jQuery('.editor-richtext p').text('sup!!')")
    session.find('.editor-richtext').click
    session.find('.blue.dropdown.options.icon_arrow_carrot_down').click
    session.find('.blue.dropdown.options.icon_arrow_carrot_down').click
    session.execute_script('jQuery(".create_post_button").removeAttr("disabled");')
    session.execute_script('jQuery(".create_post_button").removeClass("disabled");')
    session.find('.create_post_button').click
    session.execute_script('jQuery(".create_post_button").click()')
 # session.find(".start .label select option[value='4']").click
    #you can click on the button but then it closes without saving and there's no form element
  end


end