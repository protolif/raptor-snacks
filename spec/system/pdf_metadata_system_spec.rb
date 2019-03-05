require "web_helper"

RSpec.describe "the endpoint", type: :system do
  it "responds in JSON" do
    visit '/pdf_metadata?urls[]=http://g.cn'
    expect(page.body).to include('{')
  end

  it "accepts the urls[] parameter" do
    visit '/pdf_metadata?urls[]=http://g.cn'
    expect(page.body).to include('http://g.cn')
  end

  it "accepts multiple urls" do
    visit '/pdf_metadata?urls[]=http://g.cn,http://c.cc,http://e.tc'
    expect(page.body).to include('http://g.cn')
    expect(page.body).to include('http://c.cc')
    expect(page.body).to include('http://e.tc')
  end
end
