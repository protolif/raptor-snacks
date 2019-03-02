require "web_helper"

RSpec.describe "the endpoint", type: :system do
  it "responds in JSON" do
    visit '/pdf_metadata'
    expect(page.body).to include('{')
  end
end
