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

newCompany = Company.new

# Inspect newCompany
# p newCompany

newCompany["name"] = "Google"
newCompany["city"] = "Mountain View"
newCompany["state"] = "California"
newCompany["url"] = "www.Google.com"

newCompany.save

puts "Added: #{newCompany["name"]}"

puts "There are #{Company.all.count} companies"

p newCompany

# 3. query companies table to find all row with California company

# 4. query companies table to find single row for Apple

# 5. read a row's column value

# 6. update a row's column value

# 7. delete a row
