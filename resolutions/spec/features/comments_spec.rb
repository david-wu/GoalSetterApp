require 'spec_helper'

def sign_up_as_dwac
  visit new_user_url
  fill_in 'Username', with: "cats"
  fill_in 'Password', with: "arecool"
  click_button 'Sign Up'
end

def sign_up_as_pikachu
  visit new_user_url
  fill_in 'Username', with: "pikachu"
  fill_in 'Password', with: "pikapika"
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

def make_public_goal
  visit new_goal_url
  fill_in "Title", with: "Become a Pokemon master!"
  choose('Public')
  click_button('Make New Goal')
end

def make_private_goal
  visit new_goal_url
  fill_in "Title", with: "Kill Pikachu!"
  choose('Private')
  click_button('Make New Goal')
end

feature "new comments on goals" do

  it "should redirect to goal show page and display comments" do
    sign_up_as_dwac
    make_public_goal
    click_link 'Become a Pokemon master!'
    fill_in "Body", with: "Good Luck!"
    click_button('Comment')
    expect(page).to have_content 'Good Luck!'
  end

end

feature "new comments on users" do

  it "should redirect to user show page and display comments" do
    sign_up_as_dwac
    make_public_goal
    click_link 'cats'
    fill_in "Body", with: "Good Luck!"
    click_button('Comment')
    expect(page).to have_content 'Good Luck!'
  end

end

#
# feature "the goal creation process" do
#
#   it "visiting goal index or goal creation page redirects logged out user to sign in page" do
#     visit new_goal_url
#     expect(page).to have_content 'Sign Up'
#     expect(page).to have_content 'Username'
#     expect(page).to have_content 'Password'
#   end
#
#   feature "signed up a user" do
#     before :each do
#       sign_up_as_dwac
#     end
#
#     it "shows goal index after sign up" do
#       expect(page).to have_content 'Goals'
#       expect(page).to have_content 'New Goal'
#     end
#
#     it "shows link to new goal page on goal index page" do
#       visit goals_url
#       click_link "Create New Goal"
#       expect(page).to have_content 'Create New Goal'
#       expect(page).to have_content 'Title'
#       expect(page).to have_content 'Private'
#       expect(page).to have_content 'Public'
#     end
#
#     it "makes new goals and lists them on index page" do
#       make_public_goal
#       visit goals_url
#       expect(page).to have_content 'Become a Pokemon master!'
#     end
#
#     it "makes new goals and lists them on index page publically" do
#       make_public_goal
#       log_out
#       sign_up_as_pikachu
#       visit goals_url
#       expect(page).to have_content 'Become a Pokemon master!'
#     end
#
#     it "makes new private goals visible to self" do
#       make_private_goal
#       visit goals_url
#       expect(page).to have_content 'Kill Pikachu!'
#     end
#
#     it "makes new private goals invisible to other users" do
#       make_private_goal
#       log_out
#       sign_up_as_pikachu
#       visit goals_url
#       expect(page).to_not have_content 'Kill Pikachu!'
#     end
#   end
# end
#
# feature "the read goals process" do
#
#   it "displays the comments of all the public goals" do
#     sign_up_as_dwac
#     make_public_goal
#     click_link 'Become a Pokemon master!'
#   end
#
# end
#
# feature "the update goals process" do
#
#   it "updates the title of the link of the logged in user" do
#     sign_up_as_dwac
#     make_public_goal
#     click_link 'Become a Pokemon master!'
#     click_link 'Edit'
#     fill_in "Title", :with => 'To Kill David'
#     click_button 'Edit Goal'
#     click_link "Goals"
#     expect(page).to have_content "To Kill David"
#   end
#
#   it "updates a goal the logged in user" do
#     sign_up_as_dwac
#     make_public_goal
#     click_link 'Become a Pokemon master!'
#     click_link 'Edit'
#     choose('Private')
#     click_button 'Edit Goal'
#     expect(page).to have_content "private"
#   end
# end
#
# feature "the delete goals process"
#   it "deletes a goal of the logged in user" do
#     sign_up_as_dwac
#     make_public_goal
#     click_link 'Become a Pokemon master!'
#     click_button 'Delete'
#     expect(page).not_to have_content 'Become a Pokemon master!'
#   end
# end