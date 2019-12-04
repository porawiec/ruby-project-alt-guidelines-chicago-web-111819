require_all 'lib'

cf1 = Coffee.create(ctype: "Espresso", shots: 1, milk: 0, foam: 0)
cf2 = Coffee.create(ctype: "Doppio", shots: 2, milk: 0, foam: 0)
cf3 = Coffee.create(ctype: "Short Macchiato", shots: 1, milk: 0, foam: 1)
cf4 = Coffee.create(ctype: "Long Macchiato", shots: 2, milk: 0, foam: 1)
cf5 = Coffee.create(ctype: "Latte", shots: 1, milk: 1, foam: 1)
cf6 = Coffee.create(ctype: "Cappuccino", shots: 1, milk: 1, foam: 1)
cf7 = Coffee.create(ctype: "Flat White", shots: 1, milk: 1, foam: 0)



john = User.create(name: "John")
alex = User.create(name: "Alex")
rob = User.create(name: "Robert")
carrie = User.create(name: "Carrie")
allie = User.create(name: "Allie")
brit = User.create(name: "Brittany")

jesp1 = Tasting.create(user_id: john.id, coffee_id: cf1.id)
jdop1 = Tasting.create(user_id: john.id, coffee_id: cf2.id)
jesp2 = Tasting.create(user_id: john.id, coffee_id: cf1.id)
aesp1 = Tasting.create(user_id: alex.id, coffee_id: cf1.id)
adop1 = Tasting.create(user_id: alex.id, coffee_id: cf2.id)
asma1 = Tasting.create(user_id: alex.id, coffee_id: cf3.id)


jesp1r = Review.create(review: 9, tasting_id: jesp1.id, user_id: john.id, coffee_id: cf1.id)
jdop1r = Review.create(review: 4, tasting_id: jdop1.id, user_id: john.id, coffee_id: cf2.id)
jesp2r = Review.create(review: 7, tasting_id: taste.id, user_id: john.id, coffee_id: cf1.id)
aesp1r = Review.create(review: 5, tasting_id: taste.id, user_id: alex.id, coffee_id: cf1.id)
adop1r = Review.create(review: 2, tasting_id: taste.id, user_id: alex.id, coffee_id: cf2.id)