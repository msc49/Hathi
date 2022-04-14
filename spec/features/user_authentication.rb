require 'rails_helper'

RSpec.feature 'User Authentication ', type: :feature do

  before :each do
    visit '/'
  end

  scenario 'can sign up' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    expect(page).to have_content("Welcome to Hathi ")
  end

  scenario 'cannot sign up because short password' do
    sign_up(username: "test", email: "test@test.com", password: "123", password_confirmation: "123")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario 'cannot sign up because password and password confirmation dont not match' do
    sign_up(username: "test", email: "test@test.com", password: "123456", password_confirmation: "1234567")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'can login' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    login(username: "test", password: "test12345")
    expect(page).to have_content("Welcome to Hathi ")
  end

  scenario 'can login with email ' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    login(username: "test@test.com", password: "test12345")
    expect(page).to have_content("Welcome to Hathi ")
  end

  scenario 'cannot login because incorrect email ' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    login(username: "test2@test.com", password: "test12345")
    expect(page).not_to have_content("Welcome to Hathi ")
  end

  scenario 'cannot login because incorrect password ' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    login(username: "test@test.com", password: "test123456")
    expect(page).not_to have_content("Welcome to Hathi ")
  end

  scenario 'cannot login because incorrect username ' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    login(username: "test4", password: "test123456")
    expect(page).not_to have_content("Welcome to Hathi ")
  end

  scenario 'can log out ' do
    sign_up(username: "test", email: "test@test.com", password: "test12345", password_confirmation: "test12345")
    logout()
    expect(page).not_to have_content("Welcome to Hathi ")
    expect(page).to have_content("The next biggest social platform")
  end





end