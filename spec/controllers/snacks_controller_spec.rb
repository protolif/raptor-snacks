require 'rails_helper'

RSpec.describe SnacksController, type: :controller do
  it "renders the index" do
    get :index
    expect(response).to have_http_status(200)
  end
end
