require "spec_helper"
require "rails_helper"

feature "Add goal for user" do


  it "goal index has a 'New Goal' link to new goal page" do
    visit '/goals'
    expect(page).to have_content "New Goal"
  end

  it "Clicking 'New Goal' redirects to new goal page" do
    visit '/goals'
    click_link 'New Goal'
    expect(page).to have_content "Enter New Goal"
  end

  it "takes a description" do
    visit "/goals/new"
    expect(page).to have_content "Description"
  end

  it "redirects to goal show page on successful creation" do
    make_goal
    expect(page).to have_content "lose 20 lbs"
  end
end

feature "Goal index page" do

  it "displays all public and current user goals" do
    make_goal
    visit "/goals"
    expect(page).to have_content "lose 20 lbs"
  end

  it "displays if a goal has been completed" do
    make_goal
    visit "/goals"
    expect(page).to have_content "Not Completed"
  end

  it "does not display private goals of other users" do
    make_goal
    click_button "Sign Out"
    visit "/goals"
    expect(page).not_to have_content "lose 20 lbs"
  end

  it "changes goal status to completed when 'complete' button is clicked" do
    make_goal
    visit "/goals"
    click_button "Completed"
    expect(page).to have_content "Goal Completed!"
  end


end
