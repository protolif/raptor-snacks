require "web_helper"

RSpec.describe "the home page", type: :system do
  it "loads OK" do
    visit root_path
    expect(page.body).not_to be_empty
  end

  it "should have a form" do
    visit root_path
    expect(page.has_selector?('form'))
  end
end
