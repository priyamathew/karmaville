require 'spec_helper'

describe "user can navigate through pages" do

  before(:each) do
    200.times do
      FactoryGirl.create(:user_with_karma)
    end
  end

  it "page numbers for next set of 5 show up on page" do
    visit root_url
    click_link rand(5)
  end

  it "if on index page the previous button is grayed out" do
    visit root_url
    expect(page).to have_css 'li.disabled', text: "Prev"
  end


  it "when clicking previous it goes to previous set" do
    visit root_url
    click_link "2"
    click_link "Prev"
    expect(page).to have_css 'li.disabled', text: "Prev"
  end

  it "when clicking next it goes to next set" do
    visit root_url
    click_link "Next"
    expect(page).to have_css 'li.active', text: "6"
  end


  it "if on last page the next button is grayed out" do
  end

end
