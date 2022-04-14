require 'rails_helper'

RSpec.feature 'User Authentication ', type: :feature do

  before :each do
    visit '/'
  end

  scenario 'can go to chatroom' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    expect(page).to have_content("Hello test ")
  end

  scenario 'can go to chatroom and see members' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    expect(page).to have_content("Total Members: 1")
  end

  scenario 'cannot go to chatroom without logging in' do
    visit('/chatrooms')
    expect(page).not_to have_content("Hello test ")
    expect(page).not_to have_content("Total Members: 1")
  end

  scenario 'can go to chatroom and see create a room' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    create_chatroom(room: "Cheddar")
    expect(page).to have_content("Cheddar")
  end

  scenario 'can go to chatroom and  see other online users' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    logout()
    sign_up(username: "goku", email: "test11@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    expect(page).to have_content("goku")
  end

  scenario 'can go to chatroom and see total members increase' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    logout()
    sign_up(username: "goku", email: "test11@test.com", password: "test12345", password_confirmation: "test12345")
    visit('/chatrooms')
    expect(page).to have_content("Total Members: 2")
  end















end