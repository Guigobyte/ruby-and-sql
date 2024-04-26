# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

puts "There are #{Company.all.count} companies"

# 2. insert new rows in companies table
# Inspect company
# p company

company = Company.new
company["name"] = "Google"
company["city"] = "Mountain View"
company["state"] = "CA"
company["url"] = "https://www.Google.com"
company.save

puts "There are #{Company.all.count} companies"

# Add another company
company = Company.new
company["name"] = "Apple"
company["city"] = "Cupertino"
company["state"] = "CA"
company["url"] = "https://www.Apple.com"
company.save

puts "There are #{Company.all.count} companies"

# Add ANOTHER company
company = Company.new
company["name"] = "Amazon"
company["city"] = "Seattle"
company["state"] = "WA"
company["url"] = "https://www.Amazon.com"
company.save

puts "There are #{Company.all.count} companies"

# Add ANOTHER company
company = Company.new
company["name"] = "Twitter"
company["city"] = "San Francisco"
company["state"] = "CA"
company["url"] = ""
company.save

puts "There are #{Company.all.count} companies"

# 3. query companies table to find all row with California company

all_companies = Company.all
# p all_companies

# Get just CA companies
calCompanies = Company.where({"state" => "CA"})
# p calCompanies

# puts "California companies: #{calCompanies.count}"

# 4. query companies table to find single row for Apple

apple = Company.find_by({"name" => "Apple"})
# p apple

# 5. read a row's column value
# p apple["name"]
# p apple["url"]
# p apple["id"]

# 6. update a row's column value
twitter = Company.find_by({"name" => "Twitter"})

twitter["url"] = "https://www.twitter.com"
twitter["name"] = "X (Formerly Twitter)"
# p twitter
twitter.save

# 7. delete a row
x = Company.find_by({"name" => "X (Formerly Twitter)"})
x.destroy

puts "There are #{Company.all.count} companies"