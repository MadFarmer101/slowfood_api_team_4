RSpec.describe Api::V1::OrdersController, type: :request do
    let!(:product_1) {create(:product, name: 'Risoto')}
    let!(:product_2) {create(:product, name: 'Pasta')}
     before do
        post '/api/v1/orders', params: {product_id: product_1.id }
        @order_id = JSON.parse(response.body)['order_id']
     end

    it 'responds with success message' do
        expect(JSON.parse(response.body)['message']).to eq 'The product has been added to your order'
    end
end