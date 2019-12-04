require_all 'lib'

Coffee.create(ctype: "Espresso", shots: 1, milk: 0, foam: 0)
Coffee.create(ctype: "Doppio", shots: 2, milk: 0, foam: 0)
Coffee.create(ctype: "Short Macchiato", shots: 1, milk: 0, foam: 1)
Coffee.create(ctype: "Long Macchiato", shots: 2, milk: 0, foam: 1)
Coffee.create(ctype: "Latte", shots: 1, milk: 1, foam: 1)
Coffee.create(ctype: "Cappuccino", shots: 1, milk: 1, foam: 1)
Coffee.create(ctype: "Flat White", shots: 1, milk: 1, foam: 0)



User.create(name: "John")
User.create(name: "Alex")
User.create(name: "Robert")
User.create(name: "Carrie")
User.create(name: "Allie")
User.create(name: "Brittany")

Tasting.create(user_id: john.id, coffee_id: cafe.id)

Review.create(review: 5, tasting_id: taste.id, user_id: john.id, coffee_id: cafe.id)