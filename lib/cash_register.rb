require 'pry'
class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @last_transaction = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    if quantity == 0
      @total += price
      @items << title
    else
      self.total += quantity * price
      quantity.times do
        @items << title
      end
    end
    self.last_transaction = quantity * price
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      total_discount = self.total * (self.discount / 100.00)
      self.total = self.total - total_discount
      "After the discount, the total comes to $#{self.total.round}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
