class CashRegister

    attr_accessor :discount, :total, :item_list, :last_item_price, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_list = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times do
            @item_list << item
        end
        self.total += price * quantity
        self.last_item_price = price * quantity
        @last_item = [item] * quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= (self.total * (discount/100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        return @item_list
    end

    def void_last_transaction
        self.total -= self.last_item_price
        @item_list -= @last_item

        if @item_list.empty?
            self.total = 0
        end
    end
end