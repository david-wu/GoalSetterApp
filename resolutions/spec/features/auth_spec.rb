require 'spec_helper'

def sign_up_as_dwac
  visit new_user_url
  fill_in 'Username', with: "cats"
  fill_in 'Password', with: "arecool"
  click_button 'Sign Up'
end

def sign_in_as_dwac
  visit new_session_url
  fill_in 'Username', with: "cats"
  fill_in 'Password', with: "arecool"
  click_button 'Sign In'
end

def log_out
  click_button "Sign Out"
end

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      sign_up_as_dwac
      expect(page).to have_content 'cats'
    end

    it "shows error if sign up without username" do
      visit new_user_url
      fill_in "Password", with: "arecool"
      click_button "Sign Up"
      expect(page).to have_content "Username can't be blank"
    end

    it "shows error if sign up without password" do
      visit new_user_url
      fill_in "Username", with: "cats"
      click_button "Sign Up"
      expect(page).to have_content "Password can't be blank"
    end

    it "shows error if sign up with short password" do
      visit new_user_url
      fill_in "Password", with: "are"
      click_button "Sign Up"
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end
end

feature "logging in" do
  before :each do
    sign_up_as_dwac
    log_out
  end

  it "shows login page" do
    expect(page).to have_content 'Sign In'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  it "shows username on the homepage after login" do
    sign_in_as_dwac

    expect(page).to have_content 'cats'
    expect(page).to have_button 'Sign Out'
  end

end

feature "logging out" do
  before :each do
    sign_up_as_dwac
    log_out
  end

  it "begins with logged out state" do
    expect(page).to have_content 'Sign In'
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).to_not have_content 'cats'
  end

  it "doesn't show logout button on homepage after logout" do
    expect(page).not_to have_button 'Sign Out'
  end

end