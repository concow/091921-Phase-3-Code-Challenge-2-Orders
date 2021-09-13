class Customer < ActiveRecord::Base
    has_many :orders
    has_many :products, through: :orders

    def cancel_order(order)
        if order
            self.orders.update(status: "cancelled")
        end
    end

    def total_spent
        # self.orders.sum(&:price)
        check = self.products.sum(&:price)
        if check != "cancelled"
            return check
        end
    end
end