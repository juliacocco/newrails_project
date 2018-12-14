# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
User.destroy_all
Shop.destroy_all
Offer.destroy_all
Product.create(bar_code: 100,
               model: "Espresso",
               brand: "Kmart",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "Coffe machine. 15 bar pressure. Single or double espresso shot",
               average_rating: 3,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093817/nearbuy/products/product_1.jpg")
product1_id = Product.last.id
Product.create(bar_code: 101,
               model: "Cafe Barista",
               brand: "Sunbeam",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "1.7L. 15 bar pump. Metal and plastic",
               average_rating: 2,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093821/nearbuy/products/product_2.jpg")
product2_id = Product.last.id
Product.create(bar_code: 102,
               model: "Tiny",
               brand: "Lavazza",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "246 mm HEIGHT. 2.7 kg WEIGHT. Transparent water tank",
               average_rating: 4,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093824/nearbuy/products/product_3.jpg")
product3_id = Product.last.id
Product.create(bar_code: 103,
               model: "Anima",
               brand: "Gaggia",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "Stainless Steel. Pannarello Steam Wand. Automated Cleaning and Maintenance",
               average_rating: 4,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093826/nearbuy/products/product_4.jpg")
product4_id = Product.last.id
Product.create(bar_code: 104,
               model: "Senseo II 7810 HD",
               brand: "Philips",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "Fresh cappuccino and latte. Integrated milk frother. Easy-clean function",
               average_rating: 3,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093829/nearbuy/products/product_5.jpg")
product5_id = Product.last.id
Product.create(bar_code: 105,
               model: "Scultura",
               brand: "DeLonghi",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "Tank capacity: 1.4 litres. 15-bar pressure. Ground coffee & pod coffee",
               average_rating: 4,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093836/nearbuy/products/product_6.jpg")
product6_id = Product.last.id
Product.create(bar_code: 106,
               model: "Colombia",
               brand: "Nespresso",
               category: "Home & Kitchen",
               product_type: "Coffee Machine",
               specs: "Tank capacity: 0.7 litres. 19-bar pressure. Pod coffee",
               average_rating: 3,
               remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093839/nearbuy/products/product_7.jpg")
product7_id = Product.last.id
Shop.create(commercial_name: "Blanco Electronicos",
            legal_name: "Juan Blanco S.A.",
            company_number: "1000",
            address: "Carrer de Pi i Margall, 22, 24, 08025 Barcelona",
            remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093904/nearbuy/shops/shop_1.jpg")
shop1_id = Shop.last.id
Shop.create(commercial_name: "Boutique Nespresso",
            legal_name: "Francesc Macià S.A.",
            company_number: "1001",
            address: "Carrer de la Indústria, 38, 08025 Barcelona",
            remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093907/nearbuy/shops/shop_2.jpg")
shop2_id = Shop.last.id
Shop.create(commercial_name: "Miró Electrodomésticos",
            legal_name: "Miró Electrodomésticos S.A.",
            company_number: "1002",
            address: "Carrer de Sant Antoni Maria Claret, 50, 08025 Barcelona",
            remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093911/nearbuy/shops/shop_3.jpg")
shop3_id = Shop.last.id
Shop.create(commercial_name: "Martinez para la casa‎",
            legal_name: "Jordi Martinez S.A.",
            company_number: "1003",
            address: "Passeig de Sant Joan, 202, 08037 Barcelona",
            remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093913/nearbuy/shops/shop_4.jpg")
shop4_id = Shop.last.id
Shop.create(commercial_name: "Casaideas",
            legal_name: "Casaideas S.A.",
            company_number: "1004",
            address: "Carrer de la Indústria, 49, 08025 Barcelona",
            remote_photo_url: "https://res.cloudinary.com/dmnwhkfxu/image/upload/v1544093916/nearbuy/shops/shop_5.jpg")
shop5_id = Shop.last.id
Offer.create(product_id: product1_id,
             shop_id: shop1_id,
             price: 36,
             description: "Two Warmers, Upper and Lower and Two Glass Decanters in Black is an integral part of any ofﬁce coffee service program.",
             stock: 3)
Offer.create(product_id:  product2_id,
             shop_id: shop2_id,
             price: 42,
             description: "Hotter Coffee and brew strength options - the best of both worlds! the Cuisinart 12-Cup programmable thermal coffeemaker is equipped with cutting edge Coffee technology to give you hotter Coffee without sacrificing taste.",
             stock: 5)
Offer.create(product_id:  product3_id,
             shop_id: shop4_id,
             price: 45,
             description: "Be your own barista with this amazing coffee machine. This compact automatic espresso machine includes all of the features of our full-size machines, but in a smaller, more convenient size. You and your guests can enjoy delicious cappuccinos and lattes anytime.",
             stock: 7)
Offer.create(product_id:  product4_id,
             shop_id: shop5_id,
             price: 27,
             description: "When you're in a rush- every minute counts. With the Coffee Maker & Grinder, you can check that time consuming, grinding and brewing off your to-do list.",
             stock: 12)
Offer.create(product_id:  product5_id,
             shop_id: shop2_id,
             price: 67,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 9)
Offer.create(product_id:  product6_id,
             shop_id: shop3_id,
             price: 23,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 2)
Offer.create(product_id:  product7_id,
             shop_id: shop4_id,
             price: 44,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 9)
Offer.create(product_id:  product3_id,
             shop_id: shop1_id,
             price: 72,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 10)
Offer.create(product_id:  product4_id,
             shop_id: shop3_id,
             price: 34,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 6)
Offer.create(product_id:  product5_id,
             shop_id: shop2_id,
             price: 63,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 4)
Offer.create(product_id:  product7_id,
             shop_id: shop4_id,
             price: 84,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 11)
Offer.create(product_id:  product6_id,
             shop_id: shop5_id,
             price: 89,
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
             stock: 7)
User.create(email: "sergi@mail.com", password: "123456", shop_id: shop1_id , seller: true)
User.create(email: "jshop@mail.com", password: "123456", shop_id: shop2_id , seller: true)
User.create(email: "alfonso@mail.com", password: "123456", shop_id: shop3_id , seller: true)
User.create(email: "marco@mail.com", password: "123456", shop_id: shop4_id , seller: true)
User.create(email: "xun@mail.com", password: "123456", shop_id: shop5_id , seller: true)
User.create(email: "user@mail.com", password: "123456", shop_id: nil)
