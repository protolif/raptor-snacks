require "web_helper"

RSpec.describe "the home page", type: :system do
  it "should have a form pointed at the endpoint that returns JSON" do
    visit root_path
    within("form[action='/pdf_metadata']") do
      page.fill_in 'urls[]', with: 'http://example.com'
      click_button 'Feed Me'
    end
    expect(page.body).to include('{')
  end
end
