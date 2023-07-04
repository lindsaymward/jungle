module ProductHelper
  def sold_out?(product)
    true if product.quantity == 0
  end
end
