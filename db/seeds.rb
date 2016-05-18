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
BusinessCategory.delete_all
Photo.delete_all
Phone.delete_all
Video.delete_all
Product.delete_all
WorkingDay.delete_all
User.delete_all
Address.delete_all

# #------------------------------------------------------------
# # Create some categories
puts "creating category"	
category1 = Category.create(name: "Restaurants")
category2 = Category.create(name: "Pizza")
category3 = Category.create(name: "Fast Food")
category4 = Category.create(name: "Automobile")

# #------------------------------------------------------------
# # Create country and city with country 
puts "creating contry and businesses"

country = Country.create(name: "Kosova")
city = country.cities.build(name: "Prishtina", prefix: 10000)
city.save

address1 = Address.create(city_id: city.id,  name: "Rame Bllaca", latitude: 42.643704, longitude: 21.106472)
address2 = Address.create(city_id: city.id,  name: "Fushe Kosove Arberia", latitude: 42.672789, longitude: 21.178678)

business  = Business.create(name: "Pizza Hallall", email: "pizza@hotmail.com", description: "This is a enterprises wich sold some pizza, different name as pizza restaurant")
business1 = Business.create(name: "Bmw", email: "bmw24@live.com", description: "This is a enterprises wich sold some bmw, different name as Baki automobile")
business2 = Business.create(name: "Baristas", email: "Baristas@gmail.com", description: "This is a enterprises wich sold some fishs and meet, different name as fish restaurant")


# #-------------------------------------------------------------

Day.create(name: "Monday")
Day.create(name: "Tuesday")
Day.create(name: "Wednesday")
Day.create(name: "Thurday")
Day.create(name: "Friday")


# #-------------------------------------------------------------


business_address = BusinessAddress.create
business_address.business = business
business_address.address = address1


business_address1 = BusinessAddress.create
business_address1.business = business
business_address1.address = address2


business_address2 = BusinessAddress.create
business_address2.business = business1
business_address2.address = address1


business_address3 = BusinessAddress.create
business_address3.business = business2
business_address3.address = address1

business_address.save
business_address1.save
business_address2.save
business_address3.save


# #-------------------------------------------------------------
# # create category for businesses

business_category = BusinessCategory.create
business_category.business = business
business_category.category = category1

business_category.save

business_category1 = BusinessCategory.create
business_category1.business = business
business_category1.category = category2


business_category1.save

business_category2 = BusinessCategory.create
business_category2.business = business1
business_category2.category = category4

business_category3 = BusinessCategory.create
business_category3.business = business2
business_category3.category = category2


business_category2.save
business_category3.save

# #-------------------------------------------------------------


User.create(email: "admin@gmail.com", password: "admin123", admin: true)
User.create(email: "client@gmail.com", password: "client123", admin: false)

puts "complited.."