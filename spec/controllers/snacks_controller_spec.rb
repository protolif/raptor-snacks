require 'rails_helper'

RSpec.describe SnacksController, type: :controller do
  it "renders the index OK" do
    get :index
    expect(response).to render_template(:index)
    expect(response).to have_http_status(200)
  end
end
