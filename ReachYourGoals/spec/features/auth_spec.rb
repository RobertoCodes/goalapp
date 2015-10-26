require "spec_helper"
require "rails_helper"

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      fill_in "Username", with: "superman"
      fill_in "Password", with: "password"
      click_button "Sign Up"
      expect(page).to have_content 'superman'
    end
  end

  it "rejects blank username" do
    fill_in "Password", with: "sijfwwe"
    click_button "Sign Up"
    expect(page).to have_content "Username can't be blank"
  end

  it "rejects password that is too short" do
    fill_in "Username", with: "flyman"
    fill_in "Password", with: "house"
    click_button "Sign Up"
    expect(page).to have_content "Password is too short"
  end

  feature "logging in" do
    it "shows username on the homepage after login" do
      sign_up_as_superman
      sign_in_as_superman
      expect(page).to have_content "superman"
    end
  end

  feature "logging out" do
    it "doesn't show username on the homepage after logout" do
      sign_up_as_superman
      sign_in_as_superman
      # click_button "Sign Out"
      expect(page).not_to have_content "superman"
    end
  end


end
