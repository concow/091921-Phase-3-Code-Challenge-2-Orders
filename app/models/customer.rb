class Customer < ActiveRecord::Base
    has_many :orders
    has_many :products, through: :orders

    def cancel_order(order)
        order = self.orders.find_by_customer_id(customer.id)
        order.destroy
        # self.orders
        # .filter {|r| r.customer.id == customer.id}
        # .each {|r| r.destroy}

    end

    def total_spent
        self.sum(:orders)
    end
end