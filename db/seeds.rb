# This will delete any existing rows from the Product and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
Customer.destroy_all
Order.destroy_all

puts "Creating Customers..."
customer1 = Customer.create(name: Faker::Name.name)
customer2 = Customer.create(name: Faker::Name.name)
customer3 = Customer.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating orders..."
# *****************************************************************
# * TODO: create orders! Remember, an order belongs to a product *
# * and an order belongs to a customer.                              *
# *****************************************************************

# Create Orders Here

order1 = Order.create(status: "ordered", num_items: 1, delivered: true, product_id: product1.id, customer_id: customer1.id)
order2 = Order.create(status: "ordered", num_items: 1, delivered: false, product_id: product1.id, customer_id: customer2.id)
order3 = Order.create(status: "ordered", num_items: 1, delivered: true, product_id: product3.id, customer_id: customer1.id)
order4 = Order.create(status: "ordered", num_items: 1, delivered: true, product_id: product4.id, customer_id: customer3.id)




puts "Seeding done!"
puts
        #ORDER
puts "Order#customer"
puts order1.customer.name
puts

puts "Order#product"
puts order1.product.name
puts
        #PRODUCT
puts "Product#orders"
puts product1.orders.map(&:status)
puts
        
puts "Product#customers"
puts product1.customers.map(&:name)
puts
        #CUSTOMER
puts "Customer#orders"
puts customer1.orders.map(&:num_items)
puts customer1.orders.map(&:status)
puts 

puts "Customer#products"
puts customer1.products.map(&:name)
puts
puts
        #ORDER ASSOCIATION
puts "Order#total_price"
puts order1.total_price
puts

puts "Order#print_invoice"
puts order1.print_invoice
puts

puts "Order#deliver"
#sets the Order#delivered attribute to true and the Order#status attribute to "delivered"
puts order2.deliver
puts
        #PRODUCT ASSOCIATION
puts "Product#create_order(customer, num_items)"
new_order = order1.create_order(customer1, 2)
puts new_order.print_invoice
puts

puts "Product#print_all_invoices"
puts product1.print_all_invoices
puts

puts "Product#number_ordered"
puts product1.number_ordered
puts

puts "Product#volume"
puts product1.volume
puts
        #CUSTOMER ASSOCIATION
puts "Customer#cancel_order(order)"
puts customer1.cancel_order(order2)
puts

puts "Customer#total_spent"
puts customer1.total_spent
puts