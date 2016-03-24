# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.delete_all
Category.delete_all
City.delete_all
Business.delete_all
BusinessCity.delete_all
BusinessCategory.delete_all
Photo.delete_all
Phone.delete_all
Video.delete_all
Product.delete_all
WorkingDay.delete_all


# #------------------------------------------------------------
# # Create some categories
# category1 = Category.create(name: "Restaurants")
# category2 = Category.create(name: "Pizza")
# category3 = Category.create(name: "Fast Food")
# category4 = Category.create(name: "Automobile")

# #------------------------------------------------------------
# # Create country and city with country 

# country = Country.create(name: "Kosova")
# city = country.cities.build(name: "Prishtina", prefix: 10000)
# city.save

# business = Business.create(name: "Pizza", logo: "logopizza.jpg", email: "pizza@hotmail.com", description: "This is a enterprises wich sold some pizza, different name as pizza restaurant")
# business1 = Business.create(name: "BMW", logo: "logobmw.jpg", email: "bmw24@live.com", description: "This is a enterprises wich sold some bmw, different name as Baki automobile")
# business2 = Business.create(name: "Delfini", logo: "logodelfini.jpg", email: "restaurant.delfini@gmail.com", description: "This is a enterprises wich sold some fishs and meet, different name as fish restaurant")


# # -----------------------------------------------------------
# # create cities with businesses (many - many)

# bc = BusinessCity.create
# bc.business = business
# bc.city = city

# bc1 = BusinessCity.create
# bc1.business = business1
# bc1.city = city

# bc2 = BusinessCity.create
# bc2.business = business1
# bc2.city = city


# bc.save
# bc1.save
# bc2.save


# #-------------------------------------------------------------
# # create category for businesses

# business_category = BusinessCategory.create
# business_category.business = business
# business_category.category = category1

# business_category.save

# business_category1 = BusinessCategory.create
# business_category1.business = business
# business_category1.category = category2


# business_category1.save

# business_category2 = BusinessCategory.create
# business_category2.business = business1
# business_category2.category = category1

# business_category3 = BusinessCategory.create
# business_category3.business = business2
# business_category3.category = category2


# business_category2.save
# business_category3.save


# #-------------------------------------------------------------

# phone = business.phones.build(phone_type: "Primary", phone_number: "045-381-083")
# product = business.products.build(title: "home pizza", description: "This pizza is very beutyfull", price: 2.30)
# day = business.working_days.build(day: "Monday", open: '10:00:00', close: '22:00:00')

# phone1 = business1.phones.build(phone_type: "Primary", phone_number: "044-123-783")
# product1 = business1.products.build(title: "BMW M5", description: "This car is very beutyfull", price: 2200)
# day1 = business1.working_days.build(day: "Monday", open: '11:00:00', close: '18:00:00')

# phone2 = business2.phones.build(phone_type: "Primary", phone_number: "044-355-800")
# product2 = business2.products.build(title: "Trofta", description: "This fish is very beutyfull", price: 5.99)
# day2 = business2.working_days.build(day: "Monday", open: '09:00:00', close: '24:00:00')

# phone.save
# product.save
# day.save

# phone1.save
# product1.save
# day1.save

# phone1.save
# product1.save
# day1.save

User.delete_all

User.create(email: "admin@gmail.com", password: "admin123", admin: true)