# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# puts "There are #{Company.all.count} companies"
# puts "There are #{Contact.all.count} contacts"

# 1. insert new rows in the contacts table with relationship to a company
appleID = Company.find_by({"name" => "Apple"})["id"]
amazonID = Company.find_by({"name" => "Amazon"})["id"]


contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim@apple.com"
contact["company_id"] = appleID
contact.save

contact = Contact.new
contact["first_name"] = "Mr"
contact["last_name"] = "Sir"
contact["email"] = "MrSir@apple.com"
contact["company_id"] = appleID
contact.save

contact = Contact.new
contact["first_name"] = "Beff"
contact["last_name"] = "Jezos"
contact["email"] = "Beff.Jezos@amazon.com"
contact["company_id"] = amazonID
contact.save

# 2. How many contacts work at Apple?
appleContacts = Contact.where({"company_id" => appleID})
numAppleContacts = appleContacts.count

puts "Number of Apple contacts: #{numAppleContacts}"

# 3. What is the full name of each contact who works at Apple?

for person in appleContacts
    firstName = person["first_name"]
    lastName = person["last_name"]

    puts "#{firstName} #{lastName}"
end