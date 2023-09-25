require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe "GET /index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the index status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
