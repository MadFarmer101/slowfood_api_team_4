class OrderSerializer < ActiveModel::Serializer
  attributes :id, :products, :total, :order_total

  def products
    products = []
    object.order_items.group_by(&:product_id).each do |key, value|
      product = Product.find(key)
      hash = { amount: value.count, name: product.name, total: (product.price * value.count) }
      products.push hash
    end
    products
  end

  def total
    object.order_items.joins(:product).sum('products.price')
  end
end
