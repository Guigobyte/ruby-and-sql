# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts


# Salesperson
salesFirst = "Ben"
salesLast = "Block"
benID = Salesperson.find_by({"first_name" => salesFirst, "last_name" => salesLast})["id"]

# Contact IDs
timID = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})["id"]
beffID = Contact.find_by({"first_name" => "Beff", "last_name" => "Jezos"})["id"]

activity = Activity.new
activity["salesperson_id"] = benID
activity["contact_id"] = timID
activity["note"] = "They dapped each other up"
activity.save

activity = Activity.new
activity["salesperson_id"] = benID
activity["contact_id"] = beffID
activity["note"] = "Jezos asked to swap pants"
activity.save






# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

puts "Activities between #{salesFirst} and Tim Cook:"

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

puts "#{salesFirst}'s Activities:"

for activity in Activity.all
    salesID = activity["salesperson_id"]
    contactID = activity["contact_id"]

    salesPerson = Salesperson.find_by({"id" => salesID})
    contact = Contact.find_by({"id" => contactID})

    contactFirst = contact["first_name"]
    contactLast = contact["last_name"]

    if salesPerson["first_name"] == "Ben" && salesPerson["last_name"] == "Block"
        puts "#{contactFirst} #{contactLast} - #{activity["note"]}"
    end
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
