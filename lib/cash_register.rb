class CashRegister
    attr_reader 
    attr_accessor :discount, :total, :items, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end 

    def add_item(title, price, quantity = 1)
        @total += quantity * price
        num = 0
        while num < quantity
            @items << title
            num += 1
        end
        @last_transaction = price * quantity 
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
        @total = (@total * (1 - @discount/100.to_f)).to_i    
        return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end
    
    def void_last_transaction
        @total -= @last_transaction
        @last_transaction = 0
        @total
    end

end

item = CashRegister.new(20)
item.add_item('apple', 20, 4)
item.add_item('apple', 20, 3)

p item.last_transaction

p item.total
item.void_last_transaction
p item.total
item.void_last_transaction
p item.total

