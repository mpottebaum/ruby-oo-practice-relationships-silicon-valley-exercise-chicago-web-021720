require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

tesla = Startup.new("Elon Musk", "Tesla", "Auto")
uber = Startup.new("Uber Founder", "Uber", "Ride Sharing")
lyft = Startup.new("Lyft Founder", "Lyft", "Ride Sharing")
car_company = Startup.new("Car Founder", "Car Co.", "Auto")

jim = VentureCapitalist.new("Jim", 900000000)
joan = VentureCapitalist.new("Joan", 10000000000)
jeremy = VentureCapitalist.new("Jeremy", 2000000000)

tesla.sign_contract(jim, "Angel", 100000)
tesla.sign_contract(joan, "Series A", 500000)

jeremy.offer_contract(uber, "Series B", 150000)
jeremy.offer_contract(lyft, "Angel", 200000)

car_company.sign_contract(jim, "Series A", 300000)

jim.offer_contract(lyft, "Angel", 400000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line