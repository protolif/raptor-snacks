require "web_helper"

RSpec.describe "the home page", type: :system do
  it "should have a form pointed at the endpoint that returns JSON" do
    visit root_path
    within("form[action='/pdf_metadata']") do
      page.fill_in 'urls[]', with: 'http://g.cn,http://c.cc,http://e.tc'
      click_button 'Feed Me'
    end
    expect(page.body).to include('{')
    expect(page.body).to include('http://g.cn')
    expect(page.body).to include('http://c.cc')
    expect(page.body).to include('http://e.tc')
  end
end
