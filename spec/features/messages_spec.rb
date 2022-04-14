require 'rails_helper'

RSpec.feature ' Messages ', type: :feature do

  before :each do
    visit '/'
  end

  scenario 'can go to chatroom and message' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    create_chatroom(room: "Cheddar")
    message(body: 'Hello Cheddar')
    expect(page).to have_content("Hello test ")
  end

  scenario 'can go to multiple chatroom and message' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    create_chatroom(room: "Cheddar")
    message_two_chats(body1: "Hello Cheddar", body2: "Hello Cheddar2", room2: "Cheddar2")
    expect(page).to have_content("Hello Cheddar2 ")
  end




end