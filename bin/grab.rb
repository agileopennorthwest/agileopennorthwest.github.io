#!/usr/bin/env ruby

require 'httparty'
require 'csv'

APP_KEY = ENV["AONW_EVENTBRITE_APP_KEY"]
USER_KEY = ENV["AONW_EVENTBRITE_USER_KEY"]

# year, eid = 2014, 9367507467
# year, eid = 2015, 13797256967
# year, eid = 2016, 19487755401
year, eid = 2018, 29127205255

class EventBrite
  include HTTParty
  base_uri "https://www.eventbrite.com/json"

  def get(method, params = {})
    params = params.merge(app_key:APP_KEY).
                    merge(user_key:USER_KEY).
                    map{|k,v| "#{k}=#{v}"}
    self.class.get("/#{method}?#{params.join("&")}")
  end

  def event_list_attendees(id)
    results = get :event_list_attendees, id:id, status:"attending"
    results = results.values.first.map{|row| row["attendee"]}
    
    results.each do |row|
      row["answers"] = Hash[*row["answers"].map{|r| r["answer"]}.map{|r| [r["question"], r["answer_text"]]}.flatten]
    end
    results
  end
end

def attendee_type(a)
  case a["discount"]
    when "ThankYou1000TimesOver" then "<a href='#sponsor' title='Sponsor'>S</a>"
    when "EveryOrgNeedsStalwarts" then "<a href='#hosts' title='Host'>H</a>"
    when "DevotedVolunteersMakeAONWHappen" then "<span title='Volunteer'>V</span>"
    end
end
def name(a)
  [a["first_name"], a["last_name"]].compact.join("&nbsp;")
end
def twitter_handle(a)
  handle = a["answers"]["Your Twitter handle, if you'd like to share it (please include the @):"]
  return nil if handle == nil
  
  handle = handle[1..-1] if handle.start_with? "@"
  "<a target='_blank' href='http://twitter.com/#{handle}'>@#{handle}</a>"
end
def company(a)
  res = a["company"]
  res == nil || res == "" ? "&nbsp;" : res
end
def role(a)
  res = a["answers"]["What's your role when you work (not necessarily job title)?"]
  res = res != "Other" ? res : a["answers"]["What's your \"other\"?"]
  "<i>#{res}</i>"
end
def city(a)
  a["answers"]['In which city/state/province do you spend most of your time?']
end

def isAttendeeNotDonor?(a)
  a.has_key?("answers") && a["answers"].size > 0
end

e = EventBrite.new
attendees = e.event_list_attendees(eid)

output_file = File.expand_path(File.dirname(__FILE__) + "/../_includes/attendees/#{year}.html")
puts "writing to #{output_file}"

File.open(output_file, "w") do |f|
  f << "<table class='table table-striped table-condensed'>\n"
  f << "<thead><tr><th>*</th><th>Name / Twitter handle</th><th>Company / Role</th><th>City</th></tr></thead>\n"
  f << "<tbody>\n"

  attendees.each do |a|
    row = [attendee_type(a),
           [name(a), twitter_handle(a)].compact.join("<br/>"),
           [company(a), role(a)].compact.join("<br/>"),
           city(a)]

    if isAttendeeNotDonor?(a)
      f << "<tr valign='top'>" << row.map{|v| "<td>#{v}</td>"}.join << "</tr>\n"
    end
  end


  f << "</tbody>\n"
  f << "</table>\n"
  f << "<p>* H=Host, V=Volunteer, S=Sponsor</p>\n"

# output_file = File.expand_path(File.dirname(__FILE__) + "/../_includes/attendees/#{year}.html")
# puts "writing to #{output_file}"
# File.open(output_file, "w") do |f|
#   f << "<table class='table table-striped table-condensed'>\n"
#   f << "<thead><tr><th></th><th>Name / Twitter</th><th>Company / Role</th><th>City</th></tr></thead>\n"
#   f << "<tbody>\n"
#
#   attendees.each do |a|
#     row = [attendee_type(a),
#            [name(a), twitter_handle(a)].compact.join("<br/>"),
#            [company(a), role(a)].compact.join("<br/>"),
#            city(a)]
#
#     if isAttendeeNotDonor?(a)
#       f << "<tr valign='top'>" << row.map{|v| "<td>#{v}</td>"}.join << "</tr>\n"
#     end
#   end
#
#   f << "</tbody>\n"
#   f << "</table>\n"

end

# csv_file = File.expand_path(File.dirname(__FILE__) + "/../public/#{year}/attendees.csv")
# puts "csv = #{csv_file}"
# CSV.open(csv_file, "wb", force_quotes:true) do |csv|
#   csv << ["Last Name",
#           "First Name",
#           "Ticket Type",
#           "IP Location",
#           "In which city and state do you spend most of your time?",
#           "What's your role when you work (not necessarily job title)?",
#           "What's your other?",
#           "Your Twitter handle, if you'd like to share it:",
#           "Do you have any dietary restrictions we should try to consider?",
#           "Company"]

#   attendees.each do |a|
#     csv << [
#       a["last_name"], 
#       a["first_name"], 
#       a["ticket_type"],
#       "",
#       a["answers"]["In which city and state do you spend most of your time?"],
#       a["answers"]["What's your role when you work (not necessarily job title)?"],
#       a["answers"]["What's your \"other\"?"],
#       a["answers"]["Your Twitter handle, if you'd like to share it:"],
#       a["answers"]["Do you have any dietary restrictions we should try to consider?"],
#       a["company"]
#     ]
#   end
# end

# puts "Wrote #{attendees.count} attendees"

# `open -a ~/Desktop/Agile\\ Open\\ Northwest\\ 2015\\ droplet.app public/2015/attendees.csv`