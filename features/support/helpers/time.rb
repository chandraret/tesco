require 'date'
require 'active_support/core_ext/integer/inflections'

# Monkey patches the Time class to provide helpful methods.

class Time
  @d=Date.today

  def self.time_now_plus_one_minute
    Time.mktime(Time.now.year, Time.now.month, Time.now.day, Time.now.hour, Time.now.min, Time.now.sec + 5).strftime("%H:%M:%S")
  end

  def self.date_now_year_month_date
    Time.now.strftime("%Y-%m-%d")
  end

  def self.date_one_day_from_now
    #Time.mktime(Time.now.year, Time.now.month, Time.now.day + 1.to_i).strftime("%Y-%m-%d")
    (@d+1).to_s
  end

  def self.date_one_day_back_from_now
    (@d-1).to_s

  end

  def self.days_back_from_now(days)
    #Time.mktime(Time.now.year, Time.now.month, Time.now.day - days.to_i).strftime("%Y-%m-%d")
    (@d-days).to_s
  end

  def self.days_from_now(days)
    #Time.mktime(Time.now.year, Time.now.month, Time.now.day + days.to_i).strftime("%Y-%m-%d")

    (@d+days).to_s
  end

  def self.date_parse(date)
    Date.strptime(date, '%d/%m/%Y')
  end

  def self.ordinalise(date)
    date.strftime("#{date.day.ordinalize} %b %Y")
  end

  def self.ordinalise_long_month(date)
    date.strftime("#{date.day.ordinalize} %B %Y")
  end
end