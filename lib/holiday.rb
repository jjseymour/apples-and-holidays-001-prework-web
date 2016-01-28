require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
  # puts "#{holiday_hash[:winter][:christmas && :new_years]}"
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    season = season.to_s
    puts "#{season.capitalize}:"
    holiday.each do |holiday_key, supplies|
      # puts "holiday_key is #{holiday_key.to_s}"
      split_holiday_string = holiday_key.to_s
      capitalized_array = []
      if split_holiday_string.include?("_")
        split_holiday_string = split_holiday_string.tr!('_', ' ')
        split_holiday_array = split_holiday_string.split
        # puts "split_holiday_array is #{split_holiday_array}"
        split_holiday_array.each do |string|
          string = string.capitalize!
          capitalized_array << string
        end
        split_holiday_string = capitalized_array.join(" ")
      else
        split_holiday_string = split_holiday_string.capitalize!
        # puts "split_holiday_string is #{split_holiday_string}"
      end
      # puts "#{split_holiday_string}"
      puts "  #{split_holiday_string}: #{supplies.join(", ")}"
      # puts "season is #{season}: holiday is #{holiday}: holiday_key is #{holiday_key} and supplies are #{supplies}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq_array = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday_2, party_array|
      party_array.each do |supplies|
        puts "supplies are #{supplies}"
        if supplies == "BBQ"
          holidays_with_bbq_array << holiday_2
        end
      end
    end
  end
  return holidays_with_bbq_array
end

 # 
 # holiday_hash => {
 #      :winter => {
 #        :christmas => ["Lights", "Wreath"],
 #        :new_years => ["Party Hats"]
 #      },
 #      :summer => {
 #        :fourth_of_july => ["Fireworks", "BBQ"]
 #      },
 #      :fall => {
 #        :thanksgiving => ["Turkey"]
 #      },
 #      :spring => {
 #        :memorial_day => ["BBQ"]
 #      }
 #    }





