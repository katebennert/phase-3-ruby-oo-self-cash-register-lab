require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        i = quantity
        while i > 0
            @items << title
            i -= 1
        end
        @last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if self.discount != 0 
            self.total -= (self.discount.to_f/100.00 * self.total.to_f)
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if self.total > 0.0
            self.total -= self.last_transaction
        else
            self.total
        end
        
    end


end
