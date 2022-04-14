module Helpers

  def sign_up(username:, email:, password:, password_confirmation:)
    sign_up_button = '/html/body/div[1]/a[2]'
    username_text = '//*[@id="user_username"]'
    email_text = '//*[@id="user_email"]'
    password_text = '//*[@id="user_password"]'
    password_confirm_text = '//*[@id="user_password_confirmation"]'
    sign_up_confirm = '/html/body/form/div[5]/input'

    find(:xpath, sign_up_button).click
    find(:xpath, email_text).set(email)
    find(:xpath, username_text).set(username)
    find(:xpath, password_text).set(password)
    find(:xpath, password_confirm_text).set(password_confirmation:)
    find(:xpath, sign_up_confirm).click

  end 

  def login(username:, email:, password:)
    logout_link = '/html/body/div/a[2]'
    sign_in_button = '/html/body/div/a[2]'
    username_text = '//*[@id="user_login"]'
    password_text_login = '//*[@id="user_password"]'
    login_button = '/html/body/form/div[4]/input'

    find(:xpath, logout_link).click
    find(:xpath, username_text).set(username)
    find(:xpath, password_text_login).set(password)
    find(:xpath, login_button).click

  end

  def logout
    logout_link = '/html/body/div/a[2]'
    find(:xpath, logout_link).click

  end

  def create_chatroom(room:)
    chatroom_text = '//*[@id="chatroom_name"]'
    add_chatroom_button - '//*[@id="side_panel"]/form/input[3]'

    visit('/chatrooms')
    find(:xpath, chatroom_text).set(room)
    find(:xpath, add_chatroom_button).click

  end

  def message(body:)
    room1_link = '//*[@id="chatrooms"]/div[2]/div/h4/a'
    message_text_box1 = '//*[@id="chat-text"]'
  end

  def message_two_chats(body1:, body2:, room2:)
    room1_link = '//*[@id="chatrooms"]/div[2]/div/h4/a'
    message_text_box1 = '//*[@id="chat-text"]'
    message_button_1 = '//*[@id="single_room"]/div[2]/form/input[3]' #c
    add_chatroom_text_2 = '//*[@id="chatroom_name"]'
    add_chatroom_button_2 = '//*[@id="side_panel"]/form/input[3]'
    room2_link = '//*[@id="chatrooms"]/div[3]/div/h4/a'
    message_text_2 = '//*[@id="chat-text"]'
    message_button_2 = '//*[@id="single_room"]/div[2]/form/input[3]'

    find(:xpath, room1_link).click
    find(:xpath, message_text_box1).set(body1)
    find(:xpath, message_button_1).click


  end




end