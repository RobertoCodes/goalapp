require "spec_helper"
require "rails_helper"


feature "Commenting on User Show Page" do

  it "displays comment text area" do
    sign_up_as_superman
    expect(page).to have_content "Comment:"
  end

  it "does not accept blank comment" do
    sign_up_as_superman
    click_button "Submit Comment"
    expect(page).to have_content "Body can't be blank"
  end

  it "displays comment on successful submission" do
    sign_up_as_superman
    fill_in "Comment:", with: "Good luck, superman"
    click_button "Submit Comment"
    expect(page).to have_content "Good luck, superman"
  end

  it "has deletes comments" do
    sign_up_as_superman
    fill_in "Comment:", with: "Good luck, superman"
    click_button "Submit Comment"
    click_button "Delete Comment"
    expect(page).not_to have_content "Good luck, superman"
  end

end
