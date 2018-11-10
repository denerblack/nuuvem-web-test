require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      purchases = 3.times.map {create(:purchase)}
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:purchases)).to eq(purchases)
    end
  end

  describe "GET #upload" do
    it "returns http success" do
      post :upload, params: { attachment: Rack::Test::UploadedFile.new("#{Rails.root}/spec/example_input.tab", "file/csv") }
      expect(response).to have_http_status(302)
    end

    it 'returns an error message' do
      post :upload
      expect(flash[:alert]).to eq('There\'s no file.')
    end
  end

end
