class Product < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def create_order(customer, num_items)
        return Order.create(customer: customer, num_items: num_items, product_id: self.id, customer_id: customer.id)
    end

    def print_all_invoices
        self.orders.map(&:print_invoice)
    end

    def number_ordered
        #total_number = self.size
        self.count(:orders)
    end

    def volume
        self.sum(:price) * (orders.num_items)
    end
end