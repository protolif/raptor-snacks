# DocRaptor.api_key "YOUR_API_KEY_HERE"
DocRaptor.configure do |config|
  config.username = "YOUR_API_KEY_HERE"
  # config.debugging = true
end

$docraptor = DocRaptor::DocApi.new
