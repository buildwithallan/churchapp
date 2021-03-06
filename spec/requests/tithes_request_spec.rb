require 'rails_helper'

RSpec.describe "Tithes", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /index" do
    it "returns http success" do
      get "/tithes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/tithes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tithes" do
    let(:membership){create(:membership)}

    it "creates a tithe" do
      post "/tithes", params: {tithe: {membership_id: membership.id, amount: 200}}

      result = Tithe.last
      expect(result.amount).to eq(200)
      expect(response).to redirect_to tithes_path
    end
  end
end

