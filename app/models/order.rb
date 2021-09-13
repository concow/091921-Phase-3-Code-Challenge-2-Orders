class Order < ActiveRecord::Base 
    belongs_to :customer
    belongs_to :product

    def total_price
        Order.sum(:num_items) * product.price
    end

    def print_invoice
        puts "Order for #{self.product.name} (#{self.num_items}) from #{self.customer.name}: $#{self.total_price}. Status: #{self.status}"
    end

    def deliver
        if (self.delivered == "false")
            return self.update.delivered == "true" && self.update.status == "delivered"
        end
        puts "#{self.delivered}"
    end
end