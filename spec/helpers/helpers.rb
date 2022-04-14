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