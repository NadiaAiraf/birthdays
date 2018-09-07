require 'date'

class Birthdays
  def initialize
    @list = []
  end

  def add_birthday(name, age, date)
    @list << {name:name,age:age,date: date}
  end

  def show_birthdays
    string = ""
    @list.each do |element|
      string = string + "#{element[:name]} #{element[:age]} #{element[:date]}\n"
    end
    string
  end
end
