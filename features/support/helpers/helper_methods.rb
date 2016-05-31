require 'date'

# Monkey patches the Time class to provide helpful methods.

class Help
  def self.month_number(month)
    month_number = Date::ABBR_MONTHNAMES.index("Dec").to_s.rjust(2, "0")
  end


end