class Product < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def create_order(customer, num_items)
        return Order.create(customer: customer, num_items: num_items, customer_id: customer.id, product_id: self.id)
    end
  
    def print_all_invoices
        self.orders.map(&:print_invoice)
    end

    def number_ordered
        #total_number = self.size
        # self.count(:orders)
         self.orders.sum(:num_items)
    end

    def volume
        check = self.orders.sum(&:status).size.to_i
        if check != "cancelled"
            return check
        end
    end
end