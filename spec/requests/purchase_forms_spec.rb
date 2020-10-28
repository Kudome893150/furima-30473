require 'rails_helper'

RSpec.describe 'PurchaseForms', type: :request do
  describe 'GET /purchase_forms' do
    it 'works! (now write some real specs)' do
      get purchase_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
