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

  it "matches the given example" do
    # From EB_Coding_Challenge.pdf
    visit '/pdf_metadata?urls[]=http://docraptor.com/examples/invoice.html'
    # The JSON string with extraneous whitespaces removed
    # with one exception, the Prince version is newer than the documentation. OK
    expect(page.body).to include(`{"1":[{"url":"http://docraptor.com/examples/invoice.html","pdf_version":1.5,"info":{"Producer":"Prince 12.4 (www.princexml.com)","Title":"Your New Project for Our Best Client"},"metadata":null,"page_count":1}]}`)
  end
end
